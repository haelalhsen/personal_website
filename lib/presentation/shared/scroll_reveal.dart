import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/theme/app_durations.dart';
import '../../core/utils/animation_helpers.dart';
import '../../state/providers/nav_provider.dart';

/// Fades + slides [child] in once it enters the viewport, then latches.
/// Relies on the page-level [scrollOffsetProvider], so it must live inside
/// the main scroll view.
class ScrollReveal extends ConsumerStatefulWidget {
  const ScrollReveal({
    required this.child,
    super.key,
    this.delay = Duration.zero,
    this.duration = AppDurations.scrollReveal,
    this.offsetY = 0.15,
    this.curve = AnimationHelpers.standardCurve,
    this.viewportFraction = 0.85,
  });

  final Widget child;
  final Duration delay;
  final Duration duration;

  /// slideY begin — fraction of child height to offset from.
  final double offsetY;

  final Curve curve;

  /// Trigger once the top of [child] crosses this fraction of screen height.
  final double viewportFraction;

  @override
  ConsumerState<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends ConsumerState<ScrollReveal> {
  final _key = GlobalKey();
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _check());
  }

  void _check() {
    if (_revealed || !mounted) return;
    final ctx = _key.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final topY = box.localToGlobal(Offset.zero).dy;
    final screenH = MediaQuery.sizeOf(context).height;
    if (topY < screenH * widget.viewportFraction) {
      setState(() => _revealed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<double>(scrollOffsetProvider, (_, __) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _check());
    });

    return KeyedSubtree(
      key: _key,
      child: widget.child
          .animate(target: _revealed ? 1 : 0, delay: widget.delay)
          .fadeIn(duration: widget.duration)
          .slideY(
            begin: widget.offsetY,
            duration: widget.duration,
            curve: widget.curve,
          ),
    );
  }
}

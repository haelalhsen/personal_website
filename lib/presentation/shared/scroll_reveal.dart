import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import '../../core/theme/app_durations.dart';

/// Wraps [child] in a visibility-triggered fade + slide-up animation.
/// Fires once when [visibilityThreshold] fraction of the widget enters viewport.
///
/// Performance: scroll notifications fire at up to 60fps. We only evaluate
/// visibility once per frame via a scheduled post-frame callback, avoiding
/// redundant render-object traversals when multiple notifications batch.
class ScrollReveal extends StatefulWidget {
  const ScrollReveal({
    required this.child,
    super.key,
    this.delay = Duration.zero,
    this.visibilityThreshold = 0.15,
  });

  final Widget child;
  final Duration delay;
  final double visibilityThreshold;

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _slide;
  bool _triggered = false;
  bool _frameScheduled = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.scrollReveal,
    );
    _opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    // Kick off an initial check after first layout; avoid LayoutBuilder's
    // per-frame post-frame callback which rearmed the check every build.
    SchedulerBinding.instance.addPostFrameCallback((_) => _scheduleCheck());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _scheduleCheck() {
    if (_triggered || _frameScheduled || !mounted) return;
    _frameScheduled = true;
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _frameScheduled = false;
      if (!mounted || _triggered) return;
      _checkVisibility();
    });
  }

  void _checkVisibility() {
    final renderObject = context.findRenderObject();
    if (renderObject == null || renderObject is! RenderBox) return;
    if (!renderObject.attached) return;

    final scrollable = Scrollable.maybeOf(context);
    if (scrollable == null) {
      _trigger();
      return;
    }

    final viewport = RenderAbstractViewport.maybeOf(renderObject);
    if (viewport == null) {
      _trigger();
      return;
    }

    final scrollPosition = scrollable.position;
    final revealOffset = viewport.getOffsetToReveal(renderObject, 0).offset;
    final visibleTop = scrollPosition.pixels;
    final visibleBottom = visibleTop + scrollPosition.viewportDimension;
    final itemHeight = renderObject.size.height;
    if (itemHeight <= 0) return;

    final visibleAmount =
        (visibleBottom - revealOffset).clamp(0.0, itemHeight);
    final visibleFraction = visibleAmount / itemHeight;

    if (visibleFraction >= widget.visibilityThreshold) {
      _trigger();
    }
  }

  void _trigger() {
    if (_triggered) return;
    _triggered = true;
    Future<void>.delayed(widget.delay, () {
      if (mounted) _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (_) {
        _scheduleCheck();
        return false;
      },
      child: FadeTransition(
        opacity: _opacity,
        child: SlideTransition(
          position: _slide,
          child: widget.child,
        ),
      ),
    );
  }
}

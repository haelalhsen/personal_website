import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/animation_helpers.dart';
import '../../../state/providers/nav_provider.dart';

const _stats = [
  (value: AppStrings.statsYearsValue, label: AppStrings.statsYearsLabel),
  (value: AppStrings.statsUsersValue, label: AppStrings.statsUsersLabel),
  (value: AppStrings.statsAppsValue, label: AppStrings.statsAppsLabel),
  (
    value: AppStrings.statsCountriesValue,
    label: AppStrings.statsCountriesLabel,
  ),
  (
    value: AppStrings.statsIndustriesValue,
    label: AppStrings.statsIndustriesLabel,
  ),
];

/// Fire the reveal when the top of the strip crosses 85% of the viewport.
const _revealViewportFraction = 0.85;

class StatsStrip extends ConsumerStatefulWidget {
  const StatsStrip({super.key});

  @override
  ConsumerState<StatsStrip> createState() => _StatsStripState();
}

class _StatsStripState extends ConsumerState<StatsStrip> {
  final _revealKey = GlobalKey();
  bool _revealed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
  }

  void _checkVisibility() {
    if (_revealed || !mounted) return;
    final ctx = _revealKey.currentContext;
    if (ctx == null) return;
    final box = ctx.findRenderObject() as RenderBox?;
    if (box == null || !box.hasSize) return;
    final topY = box.localToGlobal(Offset.zero).dy;
    final screenH = MediaQuery.sizeOf(context).height;
    if (topY < screenH * _revealViewportFraction) {
      setState(() => _revealed = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<double>(scrollOffsetProvider, (_, __) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _checkVisibility());
    });

    final isDesktop = Breakpoints.isDesktop(MediaQuery.sizeOf(context).width);

    return Container(
      key: _revealKey,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        border: Border.symmetric(
          horizontal: BorderSide(color: AppColors.borderSubtle),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.xxxl,
        vertical: AppSpacing.xl,
      ),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
        child: isDesktop
            ? Row(
                children: [
                  for (var i = 0; i < _stats.length; i++) ...[
                    Expanded(
                      child: _StatItem(
                        value: _stats[i].value,
                        label: _stats[i].label,
                        index: i,
                        active: _revealed,
                      ),
                    ),
                    if (i < _stats.length - 1)
                      _StatDivider(index: i, active: _revealed),
                  ],
                ],
              )
            : Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: AppSpacing.xl,
                runSpacing: AppSpacing.lg,
                children: [
                  for (var i = 0; i < _stats.length; i++)
                    _StatItem(
                      value: _stats[i].value,
                      label: _stats[i].label,
                      index: i,
                      active: _revealed,
                    ),
                ],
              ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({
    required this.value,
    required this.label,
    required this.index,
    required this.active,
  });

  final String value;
  final String label;
  final int index;
  final bool active;

  @override
  Widget build(BuildContext context) {
    final delay = AnimationHelpers.stagger(index);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _CountUpNumber(value: value, delay: delay, active: active),
        const SizedBox(height: AppSpacing.xs),
        Text(
          label,
          style: AppTypography.statsLabel(),
          textAlign: TextAlign.center,
        ),
      ],
    )
        .animate(target: active ? 1 : 0, delay: delay)
        .fadeIn(duration: AppDurations.scrollReveal)
        .slideY(begin: 0.25, curve: AnimationHelpers.standardCurve);
  }
}

class _CountUpNumber extends StatelessWidget {
  const _CountUpNumber({
    required this.value,
    required this.delay,
    required this.active,
  });

  final String value;
  final Duration delay;
  final bool active;

  static final _pattern = RegExp(r'^(\d+)(.*)$');

  @override
  Widget build(BuildContext context) {
    final match = _pattern.firstMatch(value);
    final target = double.tryParse(match?.group(1) ?? '') ?? 0;
    final suffix = match?.group(2) ?? '';
    final style = AppTypography.statsNumber();

    return Text('0$suffix', style: style)
        .animate(target: active ? 1 : 0, delay: delay)
        .custom(
          duration: AppDurations.countUp,
          curve: Curves.easeOutCubic,
          end: target,
          builder: (_, v, __) =>
              Text('${v.round()}$suffix', style: style),
        );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider({required this.index, required this.active});

  final int index;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.dividerHeight,
      height: AppSpacing.statsDividerHeight,
      color: AppColors.borderAccent,
    )
        .animate(
          target: active ? 1 : 0,
          delay: AnimationHelpers.stagger(index) + AppDurations.fadeQuick,
        )
        .fadeIn(duration: AppDurations.scrollReveal)
        .scaleY(begin: 0, curve: AnimationHelpers.standardCurve);
  }
}

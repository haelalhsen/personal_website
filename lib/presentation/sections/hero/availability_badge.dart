import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

class AvailabilityBadge extends StatefulWidget {
  const AvailabilityBadge({super.key});

  @override
  State<AvailabilityBadge> createState() => _AvailabilityBadgeState();
}

class _AvailabilityBadgeState extends State<AvailabilityBadge>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDurations.pulseCycle,
      lowerBound: 0.4,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.badgePaddingH,
        vertical: AppSpacing.badgePaddingV,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusPill),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PulseDot(controller: _controller),
          const SizedBox(width: AppSpacing.sm),
          Text(
            AppStrings.availableForProjects,
            style: AppTypography.badgeText(),
          ),
        ],
      ),
    );
  }
}

/// Isolated repaint scope — only this dot repaints on each pulse tick,
/// the surrounding Container/Row stays static.
class _PulseDot extends StatelessWidget {
  const _PulseDot({required this.controller});
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller,
      child: const SizedBox(
        width: AppSpacing.pulseIndicator,
        height: AppSpacing.pulseIndicator,
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.success,
          ),
        ),
      ),
    );
  }
}

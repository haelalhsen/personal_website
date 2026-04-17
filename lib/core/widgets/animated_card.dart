import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_durations.dart';
import '../theme/app_spacing.dart';

/// Card with hover border-glow (200ms) + 8px box-shadow elevation.
class AnimatedCard extends StatefulWidget {
  const AnimatedCard({
    required this.child,
    super.key,
    this.padding,
    this.borderRadius,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;

  @override
  State<AnimatedCard> createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? AppSpacing.radiusCard;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: AppDurations.cardHover,
        curve: Curves.easeOut,
        padding: widget.padding ??
            const EdgeInsets.all(AppSpacing.cardPaddingDesktop),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: _hovered ? AppColors.accentPrimary : AppColors.borderSubtle,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.15),
                    blurRadius: AppSpacing.expertiseCardShadowBlur,
                    offset: const Offset(0, AppSpacing.cardShadowOffsetY),
                  ),
                ]
              : const [],
        ),
        child: widget.child,
      ),
    );
  }
}

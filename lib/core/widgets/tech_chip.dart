import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';

class TechChip extends StatelessWidget {
  const TechChip(this.label, {super.key, this.small = false});

  final String label;
  final bool small;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal:
            small ? AppSpacing.chipPaddingHSmall : AppSpacing.chipPaddingH,
        vertical:
            small ? AppSpacing.chipPaddingVSmall : AppSpacing.chipPaddingV,
      ),
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusTag),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Text(
        label,
        style: AppTypography.chip(small: small),
      ),
    );
  }
}

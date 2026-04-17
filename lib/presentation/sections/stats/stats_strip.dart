import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

const _stats = [
  (value: AppStrings.statsYearsValue, label: AppStrings.statsYearsLabel),
  (value: AppStrings.statsUsersValue, label: AppStrings.statsUsersLabel),
  (value: AppStrings.statsAppsValue, label: AppStrings.statsAppsLabel),
  (value: AppStrings.statsCountriesValue, label: AppStrings.statsCountriesLabel),
  (value: AppStrings.statsIndustriesValue, label: AppStrings.statsIndustriesLabel),
];

class StatsStrip extends StatelessWidget {
  const StatsStrip({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Breakpoints.isDesktop(MediaQuery.sizeOf(context).width);

    return Container(
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
        constraints:
            const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
        child: isDesktop
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: _stats
                    .map((s) => _StatItem(value: s.value, label: s.label))
                    .toList(),
              )
            : Wrap(
                alignment: WrapAlignment.spaceEvenly,
                spacing: AppSpacing.xl,
                runSpacing: AppSpacing.lg,
                children: _stats
                    .map((s) => _StatItem(value: s.value, label: s.label))
                    .toList(),
              ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value, style: AppTypography.statsNumber()),
        const SizedBox(height: AppSpacing.xs),
        Text(
          label,
          style: AppTypography.statsLabel(),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

const _contactInfo = <String, String>{
  'email': AppStrings.contactEmail,
  'response': AppStrings.contactResponse,
  'preferredProjects': AppStrings.contactPreferredProjects,
  'timezone': AppStrings.contactTimezone,
};

class TerminalCard extends StatelessWidget {
  const TerminalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgSurface,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Window chrome
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.base,
              vertical: AppSpacing.terminalHeaderPadV,
            ),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.borderSubtle),
              ),
            ),
            child: Row(
              children: [
                const _Dot(color: AppColors.windowClose),
                const SizedBox(width: AppSpacing.dotGap),
                const _Dot(color: AppColors.windowMinimize),
                const SizedBox(width: AppSpacing.dotGap),
                const _Dot(color: AppColors.windowMaximize),
                const SizedBox(width: AppSpacing.sm),
                Text(
                  AppStrings.contactCardFilename,
                  style: AppTypography.mono(color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          // Code body
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppStrings.codeContactOpen,
                  style: AppTypography.mono(color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppSpacing.xs),
                for (final e in _contactInfo.entries)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.codeIndent,
                      bottom: AppSpacing.xsMed,
                    ),
                    child: RichText(
                      text: TextSpan(
                        style: AppTypography.mono(),
                        children: [
                          TextSpan(
                            text: '${e.key}: ',
                            style: AppTypography.mono(
                              color: AppColors.accentDeep,
                            ),
                          ),
                          TextSpan(
                            text: e.value,
                            style: AppTypography.mono(
                              color: AppColors.textSecondary,
                            ),
                          ),
                          const TextSpan(text: AppStrings.codeComma),
                        ],
                      ),
                    ),
                  ),
                Text(
                  AppStrings.codeClose,
                  style: AppTypography.mono(color: AppColors.textSecondary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.dotChrome,
      height: AppSpacing.dotChrome,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

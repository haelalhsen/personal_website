import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

const _profile = <String, String>{
  'name': AppStrings.profileName,
  'role': AppStrings.profileRole,
  'location': AppStrings.profileLocation,
  'timezone': AppStrings.profileTimezone,
  'available': AppStrings.profileAvailable,
  'languages': AppStrings.profileLanguages,
};

class ProfileWidgetCard extends StatefulWidget {
  const ProfileWidgetCard({super.key});

  @override
  State<ProfileWidgetCard> createState() => _ProfileWidgetCardState();
}

class _ProfileWidgetCardState extends State<ProfileWidgetCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _cursorController;

  @override
  void initState() {
    super.initState();
    _cursorController = AnimationController(
      vsync: this,
      duration: AppDurations.cursorBlink,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _cursorController.dispose();
    super.dispose();
  }

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
              vertical: AppSpacing.smPlus,
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
                  AppStrings.profileCardFilename,
                  style: AppTypography.mono(color: AppColors.textMuted),
                ),
              ],
            ),
          ),
          // Code content
          Padding(
            padding: const EdgeInsets.all(AppSpacing.base),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: AppSpacing.avatarRadius,
                        backgroundColor: AppColors.bgElevated,
                        backgroundImage: AssetImage(AppAssets.profileImage),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      Text(
                        AppStrings.fullName,
                        style: AppTypography.cardTitle(),
                      ),
                      const SizedBox(height: AppSpacing.xs),
                      Text(
                        AppStrings.jobTitle,
                        style: AppTypography.caption(
                          color: AppColors.accentPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.base),
                Text(
                  AppStrings.codeDeveloperOpen,
                  style: AppTypography.mono(color: AppColors.textSecondary),
                ),
                const SizedBox(height: AppSpacing.xs),
                for (final e in _profile.entries)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: AppSpacing.codeIndent,
                      bottom: AppSpacing.xs,
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
                              color: e.key == 'available'
                                  ? AppColors.success
                                  : AppColors.textSecondary,
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
                const SizedBox(height: AppSpacing.sm),
                Row(
                  children: [
                    Text(
                      AppStrings.codePrompt,
                      style: AppTypography.mono(),
                    ),
                    const SizedBox(width: AppSpacing.xs),
                    _BlinkingCursor(controller: _cursorController),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Isolated rebuild scope — only this widget repaints on cursor tick.
class _BlinkingCursor extends StatelessWidget {
  const _BlinkingCursor({required this.controller});
  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: controller,
      child: const _CursorBar(),
    );
  }
}

class _CursorBar extends StatelessWidget {
  const _CursorBar();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: AppSpacing.cursorWidth,
      height: AppSpacing.cursorHeight,
      child: ColoredBox(color: AppColors.accentPrimary),
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

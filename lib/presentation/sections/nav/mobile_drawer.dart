import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

// Parallel to AppStrings.navItems / navSections by index.
const _navItems = [
  (label: AppStrings.navAbout, section: 'about', index: 0),
  (label: AppStrings.navExperience, section: 'experience', index: 1),
  (label: AppStrings.navExpertise, section: 'expertise', index: 2),
  (label: AppStrings.navProjects, section: 'projects', index: 3),
  (label: AppStrings.navOpenSource, section: 'open-source', index: 4),
  (label: AppStrings.navContact, section: 'contact', index: 5),
];

class MobileDrawer extends StatelessWidget {
  const MobileDrawer({
    required this.activeIndex,
    required this.onItemTapped,
    super.key,
  });

  final int activeIndex;
  final void Function(int index) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.bgPrimary,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xxxl,
                vertical: AppSpacing.base,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      style: AppTypography.mono(color: AppColors.textPrimary)
                          .copyWith(fontSize: 16),
                      children: const [
                        TextSpan(
                          text: '{ ',
                          style: TextStyle(color: AppColors.accentPrimary),
                        ),
                        TextSpan(text: AppStrings.logoInitials),
                        TextSpan(
                          text: ' }',
                          style: TextStyle(color: AppColors.accentPrimary),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: AppColors.textPrimary),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ..._navItems.map(
              (item) => GestureDetector(
                onTap: () {
                  onItemTapped(item.index);
                  context.go('/${item.section}');
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    item.label,
                    style: AppTypography.sectionTitle(
                      color: activeIndex == item.index
                          ? AppColors.accentPrimary
                          : AppColors.textPrimary,
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.xxxl),
              child: OutlinedButton(
                onPressed: () {},
                child: const Text(AppStrings.navDownloadCv),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

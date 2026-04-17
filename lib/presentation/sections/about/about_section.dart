import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/section_label.dart';
import '../../../core/widgets/section_title.dart';
import 'profile_widget_card.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isDesktop = Breakpoints.isDesktop(size.width);

    return Container(
      width: double.infinity,
      color: AppColors.bgPrimary,
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Padding(
            padding: AppSpacing.sectionPadding(size.width),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 60, child: _AboutContent()),
                      const SizedBox(width: AppSpacing.xxxl),
                      const Expanded(flex: 40, child: ProfileWidgetCard()),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _AboutContent(),
                      const SizedBox(height: AppSpacing.xl),
                      const ProfileWidgetCard(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _AboutContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionLabel(number: '02', name: 'about'),
        const SizedBox(height: AppSpacing.base),
        const SectionTitle(AppStrings.aboutTitle),
        const SizedBox(height: AppSpacing.xl),
        ...AppStrings.aboutParagraphs.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.base),
            child: Text(p, style: AppTypography.body()),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        // Pull quote
        Container(
          padding: const EdgeInsets.only(left: AppSpacing.base),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(
                color: AppColors.accentPrimary,
                width: AppSpacing.borderThick,
              ),
            ),
          ),
          child: Text(
            AppStrings.aboutPullQuote,
            style: AppTypography.pullQuote(),
          ),
        ),
      ],
    );
  }
}

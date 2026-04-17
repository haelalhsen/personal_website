import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

const _logoFontSize = 16.0;

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isDesktop = Breakpoints.isDesktop(size.width);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.bgSurface,
        border: Border(top: BorderSide(color: AppColors.borderSubtle)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xxxl,
              vertical: AppSpacing.xxxl,
            ),
            child: isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _LogoBlock(),
                      const SizedBox(width: AppSpacing.xxxl),
                      // _NavLinks(),
                      const Spacer(),
                      _BuiltWith(),
                    ],
                  )
                : Column(
                    children: [
                      _LogoBlock(),
                      const SizedBox(height: AppSpacing.xl),
                      // _NavLinks(),
                      const SizedBox(height: AppSpacing.xl),
                      _BuiltWith(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _LogoBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: AppTypography.mono(color: AppColors.textPrimary)
                .copyWith(fontSize: _logoFontSize),
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
        const SizedBox(height: AppSpacing.sm),
        Text(
          AppStrings.footerJobTitle,
          style: AppTypography.caption(),
        ),
      ],
    );
  }
}

class _NavLinks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.xl,
      runSpacing: AppSpacing.sm,
      children: AppStrings.navItems
          .asMap()
          .entries
          .map(
            (e) => GestureDetector(
              onTap: () => context.go('/${AppStrings.navSections[e.key]}'),
              child: Text(e.value, style: AppTypography.navLink()),
            ),
          )
          .toList(),
    );
  }
}

class _BuiltWith extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          AppStrings.footerBuiltWith,
          style: AppTypography.caption(),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          '© ${DateTime.now().year} ${AppStrings.fullName}. All rights reserved.',
          style: AppTypography.caption(),
        ),
      ],
    );
  }
}

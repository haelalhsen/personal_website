import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_intro/core/constants/app_strings.dart';
import 'package:personal_intro/core/responsive/breakpoints.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';
import 'package:personal_intro/core/widgets/section_label.dart';
import 'package:personal_intro/core/widgets/section_title.dart';
import 'package:personal_intro/data/models/expertise.dart';
import 'package:personal_intro/presentation/sections/expertise/expertise_card.dart';
import 'package:personal_intro/state/providers/portfolio_provider.dart';

const _expertiseLoadingCount = 6;
const _expertiseGridDesktopCols = 3;
const _expertiseGridTabletCols = 2;

class ExpertiseSection extends ConsumerWidget {
  const ExpertiseSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final expertiseAsync = ref.watch(expertiseProvider);

    return Container(
      width: double.infinity,
      color: AppColors.bgSurface,
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Padding(
            padding: AppSpacing.sectionPadding(size.width),
            child: Column(
              children: [
                const SectionLabel(number: '04', name: 'expertise'),
                const SizedBox(height: AppSpacing.base),
                const SectionTitle('What I Do Best'),
                const SizedBox(height: AppSpacing.xxl),
                expertiseAsync.when(
                  loading: () => const _LoadingGrid(),
                  error: (_, __) => const _ErrorState(),
                  data: (items) => _ExpertiseGrid(items: items),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExpertiseGrid extends StatelessWidget {
  const _ExpertiseGrid({required this.items});

  final List<Expertise> items;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final crossAxisCount = Breakpoints.isDesktop(width)
        ? _expertiseGridDesktopCols
        : (Breakpoints.isTablet(width) ? _expertiseGridTabletCols : 1);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: AppSpacing.gutter,
        crossAxisSpacing: AppSpacing.gutter,
        mainAxisExtent: crossAxisCount == 1
            ? AppSpacing.projectSkeletonHeight
            : AppSpacing.expertiseCardHeight,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => ExpertiseCard(expertise: items[i], index: i),
    );
  }
}

class _LoadingGrid extends StatelessWidget {
  const _LoadingGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: _expertiseGridDesktopCols,
        mainAxisSpacing: AppSpacing.gutter,
        crossAxisSpacing: AppSpacing.gutter,
        mainAxisExtent: AppSpacing.expertiseCardHeightMobile,
      ),
      itemCount: _expertiseLoadingCount,
      itemBuilder: (_, __) => _SkeletonCard(),
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.bgElevated,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: AppColors.borderSubtle),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  const _ErrorState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.errorLoadExpertise,
        style: AppTypography.body(),
      ),
    );
  }
}

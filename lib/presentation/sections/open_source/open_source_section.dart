import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_intro/core/constants/app_strings.dart';
import 'package:personal_intro/core/responsive/breakpoints.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';
import 'package:personal_intro/core/utils/animation_helpers.dart';
import 'package:personal_intro/core/widgets/section_label.dart';
import 'package:personal_intro/core/widgets/section_title.dart';
import 'package:personal_intro/data/models/repo.dart';
import 'package:personal_intro/presentation/sections/open_source/contribution_graph.dart';
import 'package:personal_intro/presentation/sections/open_source/repo_card.dart';
import 'package:personal_intro/state/providers/portfolio_provider.dart';

class OpenSourceSection extends ConsumerWidget {
  const OpenSourceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final reposAsync = ref.watch(reposProvider);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionLabel(number: '06', name: 'open-source'),
                const SizedBox(height: AppSpacing.base),
                const SectionTitle('Open Source'),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  AppStrings.openSourceSubtitle,
                  style: AppTypography.body(),
                ),
                const SizedBox(height: AppSpacing.xxl),
                reposAsync.when(
                  loading: () => _LoadingGrid(width: size.width),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (repos) =>
                      _RepoGrid(repos: repos, width: size.width),
                ),
                const SizedBox(height: AppSpacing.xxl),
                // Contribution graph
                _ContributionGraphCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RepoGrid extends StatelessWidget {
  const _RepoGrid({required this.repos, required this.width});

  final List<Repo> repos;
  final double width;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = Breakpoints.isDesktop(width)
        ? 3
        : (Breakpoints.isTablet(width) ? 2 : 1);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: AppSpacing.gutter,
        crossAxisSpacing: AppSpacing.gutter,
        childAspectRatio: crossAxisCount == 1 ? 2.0 : 1.5,
      ),
      itemCount: repos.length,
      itemBuilder: (_, i) => RepoCard(repo: repos[i])
          .animate(delay: AnimationHelpers.stagger(i, baseMs: 80))
          .fadeIn(duration: 400.ms)
          .slideY(begin: 0.08, end: 0, curve: Curves.easeOut),
    );
  }
}

class _LoadingGrid extends StatelessWidget {
  const _LoadingGrid({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: AppSpacing.gutter,
        crossAxisSpacing: AppSpacing.gutter,
        childAspectRatio: 1.5,
      ),
      itemCount: 6,
      itemBuilder: (_, __) => Container(
        decoration: BoxDecoration(
          color: AppColors.bgElevated,
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          border: Border.all(color: AppColors.borderSubtle),
        ),
      ),
    );
  }
}

class _ContributionGraphCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.bgPrimary,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.openSourceGraphTitle,
            style: AppTypography.bodyMedium(),
          ),
          const SizedBox(height: AppSpacing.base),
          const ContributionGraph(),
        ],
      ),
    );
  }
}

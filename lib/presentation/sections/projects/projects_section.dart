import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_intro/core/constants/app_strings.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';
import 'package:personal_intro/core/widgets/section_label.dart';
import 'package:personal_intro/core/widgets/section_title.dart';
import 'package:personal_intro/presentation/sections/projects/project_row.dart';
import 'package:personal_intro/state/providers/portfolio_provider.dart';

const _projectsSkeletonCount = 3;

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final projectsAsync = ref.watch(projectsProvider);

    return Container(
      width: double.infinity,
      color: AppColors.bgPrimary,
      child: Center(
        child: ConstrainedBox(
          constraints:
              const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Padding(
            padding: AppSpacing.sectionPadding(size.width),
            child: Column(
              children: [
                const SectionLabel(number: '05', name: 'projects'),
                const SizedBox(height: AppSpacing.base),
                const SectionTitle('Featured Work'),
                const SizedBox(height: AppSpacing.xxl),
                projectsAsync.when(
                  loading: () => const _LoadingList(),
                  error: (_, __) => Center(
                    child: Text(
                      AppStrings.errorLoadProjects,
                      style: AppTypography.body(),
                    ),
                  ),
                  data: (projects) => ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: projects.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: AppSpacing.xl),
                    itemBuilder: (_, i) => ProjectRow(
                      project: projects[i],
                      index: i,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadingList extends StatelessWidget {
  const _LoadingList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _projectsSkeletonCount,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.xl),
      itemBuilder: (_, __) => Container(
        height: AppSpacing.projectSkeletonHeight,
        decoration: BoxDecoration(
          color: AppColors.bgElevated,
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          border: Border.all(color: AppColors.borderSubtle),
        ),
      ),
    );
  }
}

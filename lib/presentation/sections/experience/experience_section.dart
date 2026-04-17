import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_intro/core/constants/app_strings.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';
import 'package:personal_intro/core/widgets/section_label.dart';
import 'package:personal_intro/core/widgets/section_title.dart';
import 'package:personal_intro/data/models/experience.dart';
import 'package:personal_intro/state/providers/portfolio_provider.dart';
import 'experience_card.dart';

const _experienceSkeletonCount = 4;

class ExperienceSection extends ConsumerWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final experienceAsync = ref.watch(experienceProvider);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionLabel(number: '03', name: 'experience'),
                const SizedBox(height: AppSpacing.base),
                const SectionTitle('Work History'),
                const SizedBox(height: AppSpacing.xxl),
                experienceAsync.when(
                  loading: () => const _LoadingList(),
                  error: (_, __) => const _ErrorState(),
                  data: (items) => _ExperienceList(items: items),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ExperienceList extends StatelessWidget {
  const _ExperienceList({required this.items});

  final List<Experience> items;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.base),
      itemBuilder: (_, i) => ExperienceCard(
        experience: items[i],
        isCurrent: items[i].period.contains('Present'),
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
      itemCount: _experienceSkeletonCount,
      separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.base),
      itemBuilder: (_, __) => _SkeletonCard(),
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSpacing.experienceSkeletonHeight,
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
        AppStrings.errorLoadExperience,
        style: AppTypography.body(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_intro/core/responsive/breakpoints.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';
import 'package:personal_intro/core/widgets/section_label.dart';
import 'package:personal_intro/core/widgets/section_title.dart';
import 'package:personal_intro/data/models/skill.dart';
import 'package:personal_intro/state/providers/portfolio_provider.dart';

const _desktopCategoryColumns = 5;
const _desktopSkillLabelColumns = 6;

class TechStackSection extends ConsumerWidget {
  const TechStackSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final skillsAsync = ref.watch(skillsProvider);

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
                const SectionLabel(number: '07', name: 'tech-stack'),
                const SizedBox(height: AppSpacing.base),
                const SectionTitle('Tools of the Trade'),
                const SizedBox(height: AppSpacing.base),
                // Legend
                const _ProficiencyLegend(),
                const SizedBox(height: AppSpacing.xxl),
                skillsAsync.when(
                  loading: () => const CircularProgressIndicator(
                    color: AppColors.accentPrimary,
                  ),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (categories) =>
                      _SkillGrid(categories: categories, width: size.width),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProficiencyLegend extends StatelessWidget {
  const _ProficiencyLegend();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _LegendItem(symbol: '◆', label: 'Expert'),
        SizedBox(width: AppSpacing.xl),
        _LegendItem(symbol: '◇', label: 'Proficient'),
        SizedBox(width: AppSpacing.xl),
        _LegendItem(symbol: '○', label: 'Familiar'),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  const _LegendItem({required this.symbol, required this.label});

  final String symbol;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(symbol, style: AppTypography.mono()),
        const SizedBox(width: AppSpacing.xsMed),
        Text(label, style: AppTypography.caption()),
      ],
    );
  }
}

class _SkillGrid extends StatelessWidget {
  const _SkillGrid({required this.categories, required this.width});

  final List<SkillCategory> categories;
  final double width;

  @override
  Widget build(BuildContext context) {
    if (Breakpoints.isDesktop(width)) {
      return Wrap(
        children: categories
            .map(
              (c) => SizedBox(
                width: width / _desktopCategoryColumns,
                child: _CategoryColumn(category: c),
              ),
            )
            .toList(),
      );
    }

    return Column(
      children: categories.map((c) => _CategoryColumn(category: c)).toList(),
    );
  }
}

class _CategoryColumn extends StatelessWidget {
  const _CategoryColumn({required this.category});

  final SkillCategory category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(category.title, style: AppTypography.cardTitle()),
          const SizedBox(height: AppSpacing.base),
          ...category.skills.map((s) => _SkillRow(skill: s)),
          const SizedBox(height: AppSpacing.xl),
        ],
      ),
    );
  }
}

class _SkillRow extends StatelessWidget {
  const _SkillRow({required this.skill});

  final Skill skill;

  String get _symbol => switch (skill.level) {
        'expert' => '◆',
        'proficient' => '◇',
        _ => '○',
      };

  Color get _symbolColor => switch (skill.level) {
        'expert' => AppColors.accentPrimary,
        'proficient' => AppColors.accentDeep,
        _ => AppColors.textMuted,
      };

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.skillRowPadding,
      ),
      child: Row(
        children: [
          Text(
            _symbol,
            style: AppTypography.skillSymbol(color: _symbolColor),
          ),
          const SizedBox(width: AppSpacing.sm),
          if (Breakpoints.isDesktop(width))
            SizedBox(
              width: width / _desktopSkillLabelColumns,
              child: Text(
                skill.name,
                style: AppTypography.body(),
                overflow: TextOverflow.clip,
              ),
            )
          else
            Text(
              skill.name,
              style: AppTypography.body(),
              overflow: TextOverflow.clip,
            ),
        ],
      ),
    );
  }
}

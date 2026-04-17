import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_intro/core/constants/app_strings.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';

/// A GitHub-style contribution heatmap.
/// Uses deterministic pseudo-random data — swap for live API data in Phase 3.5.
class ContributionGraph extends StatefulWidget {
  const ContributionGraph({super.key});

  static const _weeks = 52;
  static const _days = 7;

  @override
  State<ContributionGraph> createState() => _ContributionGraphState();
}

class _ContributionGraphState extends State<ContributionGraph> {
  // Generated once and cached for the lifetime of the State to avoid
  // rebuilding 364 list entries on every widget rebuild.
  late final List<List<int>> _data = _generateData();

  List<List<int>> _generateData() {
    final rng = Random(42);
    return List.generate(
      ContributionGraph._weeks,
      (w) => List.generate(ContributionGraph._days, (d) {
        final isWeekend = d >= 5;
        final base = isWeekend ? 0.3 : 0.65;
        final r = rng.nextDouble();
        if (r < base * 0.25) return 0;
        if (r < base * 0.55) return 1;
        if (r < base * 0.80) return 2;
        if (r < base * 0.93) return 3;
        return 4;
      }),
    );
  }

  Color _cellColor(int level) => switch (level) {
        0 => AppColors.bgElevated,
        1 => AppColors.accentPrimary.withValues(alpha: 0.20),
        2 => AppColors.accentPrimary.withValues(alpha: 0.45),
        3 => AppColors.accentPrimary.withValues(alpha: 0.70),
        _ => AppColors.accentPrimary,
      };

  @override
  Widget build(BuildContext context) {
    const months = AppStrings.graphMonthLabels;
    const cellStride = AppSpacing.graphCellSize + AppSpacing.graphCellGap;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Month labels
        Padding(
          padding: const EdgeInsets.only(left: AppSpacing.graphMonthRowLeft),
          child: Row(
            children: List.generate(months.length, (i) {
              return SizedBox(
                width: (ContributionGraph._weeks / months.length) * cellStride,
                child: Text(
                  months[i],
                  style: AppTypography.monoMicro(),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day labels
            Column(
              children: [
                for (final d in AppStrings.graphDayLabels)
                  SizedBox(
                    height: cellStride,
                    child: Text(
                      d,
                      style: AppTypography.monoTiny(),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: AppSpacing.xs),
            // Grid
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final week in _data)
                      Padding(
                        padding: const EdgeInsets.only(
                          right: AppSpacing.graphCellGap,
                        ),
                        child: Column(
                          children: [
                            for (final level in week)
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: AppSpacing.graphCellGap,
                                ),
                                child: _GraphCell(color: _cellColor(level)),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        // Legend
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              AppStrings.graphLegendLess,
              style: AppTypography.monoMicro(),
            ),
            const SizedBox(width: AppSpacing.xs),
            for (var i = 0; i < 5; i++)
              Padding(
                padding: const EdgeInsets.only(left: AppSpacing.xxs),
                child: _GraphCell(color: _cellColor(i)),
              ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              AppStrings.graphLegendMore,
              style: AppTypography.monoMicro(),
            ),
          ],
        ),
      ],
    );
  }
}

class _GraphCell extends StatelessWidget {
  const _GraphCell({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSpacing.graphCellSize,
      height: AppSpacing.graphCellSize,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSpacing.radiusCellTiny),
      ),
    );
  }
}

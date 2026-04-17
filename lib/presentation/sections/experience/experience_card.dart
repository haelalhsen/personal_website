import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/widgets/tech_chip.dart';
import '../../../data/models/experience.dart';

class ExperienceCard extends StatefulWidget {
  const ExperienceCard({
    required this.experience,
    required this.isCurrent,
    super.key,
  });

  final Experience experience;
  final bool isCurrent;

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final accentColor =
        widget.isCurrent ? AppColors.accentPrimary : AppColors.accentDeep;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: AppDurations.cardHover,
        width: double.infinity,
        decoration: BoxDecoration(
          color: _hovered ? AppColors.bgElevated : AppColors.bgSurface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          border: Border.all(
            color: _hovered ? AppColors.accentPrimary : AppColors.borderSubtle,
          ),
        ),
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row: company + period
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    widget.experience.company,
                    style: AppTypography.cardTitle(),
                  ),
                ),
                const SizedBox(width: AppSpacing.base),
                Text(
                  widget.experience.period,
                  style: AppTypography.mono(color: AppColors.textMuted),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xs),
            // Role
            Text(
              widget.experience.role,
              style: AppTypography.mono(color: accentColor),
            ),
            const SizedBox(height: AppSpacing.base),
            // Description
            Text(
              widget.experience.description,
              style: AppTypography.body(),
            ),
            const SizedBox(height: AppSpacing.base),
            // Tags
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: widget.experience.tags
                  .map(TechChip.new)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

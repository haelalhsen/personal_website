import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_durations.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';
import 'package:personal_intro/core/utils/animation_helpers.dart';
import 'package:personal_intro/core/widgets/tech_chip.dart';
import 'package:personal_intro/data/models/expertise.dart';

// Icon map: expertise.json "icon" string → Flutter IconData
IconData _iconFor(String key) => switch (key) {
      'architecture' => Icons.account_tree_outlined,
      'state' => Icons.layers_outlined,
      'speed' => Icons.speed_outlined,
      'platform' => Icons.devices_outlined,
      'design' => Icons.palette_outlined,
      'leadership' => Icons.groups_outlined,
      _ => Icons.code_outlined,
    };

class ExpertiseCard extends StatefulWidget {
  const ExpertiseCard({
    required this.expertise,
    required this.index,
    super.key,
  });

  final Expertise expertise;
  final int index;

  @override
  State<ExpertiseCard> createState() => _ExpertiseCardState();
}

class _ExpertiseCardState extends State<ExpertiseCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: AppDurations.cardHover,
        curve: Curves.easeOut,
        padding: const EdgeInsets.all(AppSpacing.cardPaddingDesktop),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          border: Border.all(
            color: _hovered ? AppColors.accentPrimary : AppColors.borderSubtle,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.12),
                    blurRadius: AppSpacing.expertiseCardShadowBlur,
                    offset: const Offset(0, AppSpacing.cardShadowOffsetY),
                  ),
                ]
              : const [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              width: AppSpacing.iconBox,
              height: AppSpacing.iconBox,
              decoration: BoxDecoration(
                color: AppColors.accentPrimary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppSpacing.radiusButton),
                border: Border.all(
                  color: AppColors.accentPrimary.withValues(alpha: 0.2),
                ),
              ),
              child: Icon(
                _iconFor(widget.expertise.icon),
                color: AppColors.accentPrimary,
                size: AppSpacing.iconMd,
              ),
            ),
            const SizedBox(height: AppSpacing.base),
            // Title
            Text(widget.expertise.title, style: AppTypography.cardTitle()),
            const SizedBox(height: AppSpacing.sm),
            // Description
            Text(
              widget.expertise.description,
              style: AppTypography.body(),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSpacing.base),
            // Tags
            Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: widget.expertise.tags
                  .map((t) => TechChip(t, small: true))
                  .toList(),
            ),
          ],
        ),
      ),
    )
        .animate(delay: AnimationHelpers.stagger(widget.index))
        .fadeIn(duration: 500.ms)
        .slideY(begin: 0.1, end: 0, duration: 500.ms, curve: Curves.easeOut);
  }
}

import 'package:flutter/material.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_durations.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';
import 'package:personal_intro/data/models/testimonial.dart';

const _openingQuote = '"';
const _starIconSize = 16.0;

class TestimonialCard extends StatefulWidget {
  const TestimonialCard({required this.testimonial, super.key});

  final Testimonial testimonial;

  @override
  State<TestimonialCard> createState() => _TestimonialCardState();
}

class _TestimonialCardState extends State<TestimonialCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: AppDurations.cardHover,
        padding: const EdgeInsets.all(AppSpacing.cardPaddingDesktop),
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          border: Border.all(
            color:
                _hovered ? AppColors.accentPrimary : AppColors.borderSubtle,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.10),
                    blurRadius: AppSpacing.expertiseCardShadowBlur,
                    offset: const Offset(0, AppSpacing.cardShadowOffsetY),
                  ),
                ]
              : const [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Opening quote mark
            Text(_openingQuote, style: AppTypography.quoteMark()),
            const SizedBox(height: AppSpacing.sm),
            // Quote text
            Text(
              widget.testimonial.quote,
              style: AppTypography.body(color: AppColors.textPrimary)
                  .copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: AppSpacing.lg),
            // Stars
            Row(
              children: List.generate(
                widget.testimonial.rating,
                (_) => const Padding(
                  padding: EdgeInsets.only(right: AppSpacing.xxs),
                  child: Icon(
                    Icons.star_rounded,
                    color: AppColors.accentDart,
                    size: _starIconSize,
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            // Divider
            Container(
              height: AppSpacing.dividerHeight,
              decoration: const BoxDecoration(
                gradient: AppColors.sectionDivider,
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            // Author
            Text(
              widget.testimonial.author,
              style: AppTypography.bodyMedium(),
            ),
            Text(
              widget.testimonial.role,
              style: AppTypography.caption(),
            ),
          ],
        ),
      ),
    );
  }
}

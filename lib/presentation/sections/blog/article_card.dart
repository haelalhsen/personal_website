import 'package:flutter/material.dart';
import 'package:personal_intro/core/constants/app_strings.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_durations.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';
import 'package:personal_intro/data/models/article.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticleCard extends StatefulWidget {
  const ArticleCard({required this.article, super.key});

  final Article article;

  @override
  State<ArticleCard> createState() => _ArticleCardState();
}

class _ArticleCardState extends State<ArticleCard> {
  bool _hovered = false;

  String _formatDate(String iso) {
    final parts = iso.split('-');
    if (parts.length < 2) return iso;
    final month = int.tryParse(parts[1]) ?? 0;
    return '${AppStrings.monthAbbreviations[month]} ${parts[0]}';
  }

  Future<void> _launchUrl(String link) async {
    final url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('${AppStrings.errorLaunchUrl}: $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _launchUrl(widget.article.url);
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: AppDurations.cardHover,
          padding: const EdgeInsets.all(AppSpacing.lg),
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
                      blurRadius: AppSpacing.cardShadowBlur,
                      offset: const Offset(0, AppSpacing.cardShadowOffsetY),
                    ),
                  ]
                : const [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date + read time
              Row(
                children: [
                  Text(
                    _formatDate(widget.article.date),
                    style: AppTypography.mono(color: AppColors.textMuted),
                  ),
                  const Spacer(),
                  Text(
                    '${widget.article.readTime} ${AppStrings.articleReadTimeSuffix}',
                    style: AppTypography.mono(color: AppColors.textMuted),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              // Title
              Text(
                widget.article.title,
                style: AppTypography.cardTitle(
                  color: _hovered
                      ? AppColors.accentPrimary
                      : AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              // Excerpt
              Expanded(
                child: Text(
                  widget.article.excerpt,
                  style: AppTypography.body(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: AppSpacing.base),
              // Read on Medium link
              Row(
                children: [
                  Text(
                    AppStrings.articleReadOnMedium,
                    style: AppTypography.mono(
                      color: _hovered
                          ? AppColors.accentPrimary
                          : AppColors.textSecondary,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xsMed),
                  Icon(
                    Icons.arrow_forward,
                    size: AppSpacing.iconXs,
                    color: _hovered
                        ? AppColors.accentPrimary
                        : AppColors.textSecondary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

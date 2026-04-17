import 'package:flutter/material.dart';
import 'package:personal_intro/core/constants/app_strings.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_durations.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';
import 'package:personal_intro/data/models/repo.dart';
import 'package:url_launcher/url_launcher.dart';

class RepoCard extends StatefulWidget {
  const RepoCard({required this.repo, super.key});

  final Repo repo;

  @override
  State<RepoCard> createState() => _RepoCardState();
}

class _RepoCardState extends State<RepoCard> {
  bool _hovered = false;

  Color get _languageColor => switch (widget.repo.language) {
        'Dart' => AppColors.accentPrimary,
        'YAML' => AppColors.accentDart,
        'Kotlin' => AppColors.languageKotlin,
        'Swift' => AppColors.languageSwift,
        _ => AppColors.textMuted,
      };
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
        _launchUrl(widget.repo.url);
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
              // Repo icon + name
              Row(
                children: [
                  const Icon(
                    Icons.folder_outlined,
                    color: AppColors.accentPrimary,
                    size: AppSpacing.iconSm,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Text(
                      widget.repo.name,
                      style: AppTypography.bodyMedium(
                        color: AppColors.accentPrimary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              // Description
              Expanded(
                child: Text(
                  widget.repo.description,
                  style: AppTypography.body(),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              // Footer: language + stars
              Row(
                children: [
                  Container(
                    width: AppSpacing.languageDot,
                    height: AppSpacing.languageDot,
                    decoration: BoxDecoration(
                      color: _languageColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xsMed),
                  Text(
                    widget.repo.language,
                    style: AppTypography.caption(),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.star_outline_rounded,
                    color: AppColors.textSecondary,
                    size: AppSpacing.iconXs,
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Text(
                    _formatStars(widget.repo.stars),
                    style: AppTypography.caption(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatStars(int stars) {
    if (stars >= 1000) {
      return '${(stars / 1000).toStringAsFixed(1)}k';
    }
    return stars.toString();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_intro/core/responsive/breakpoints.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/utils/animation_helpers.dart';
import 'package:personal_intro/core/widgets/section_label.dart';
import 'package:personal_intro/core/widgets/section_title.dart';
import 'package:personal_intro/data/models/article.dart';
import 'package:personal_intro/presentation/sections/blog/article_card.dart';
import 'package:personal_intro/state/providers/portfolio_provider.dart';

class BlogSection extends ConsumerWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final articlesAsync = ref.watch(articlesProvider);

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
                const SectionLabel(number: '09', name: 'writing'),
                const SizedBox(height: AppSpacing.base),
                const SectionTitle('Latest Articles'),
                const SizedBox(height: AppSpacing.xxl),
                articlesAsync.when(
                  loading: () => _LoadingRow(width: size.width),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (articles) =>
                      _ArticleRow(articles: articles, width: size.width),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ArticleRow extends StatelessWidget {
  const _ArticleRow({required this.articles, required this.width});

  final List<Article> articles;
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
        childAspectRatio: crossAxisCount == 1 ? 1.4 : 1.0,
      ),
      itemCount: articles.length,
      itemBuilder: (_, i) => ArticleCard(article: articles[i])
          .animate(delay: AnimationHelpers.stagger(i))
          .fadeIn(duration: 400.ms)
          .slideY(begin: 0.08, end: 0, curve: Curves.easeOut),
    );
  }
}

class _LoadingRow extends StatelessWidget {
  const _LoadingRow({required this.width});

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
      ),
      itemCount: 3,
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

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_intro/core/responsive/breakpoints.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/utils/animation_helpers.dart';
import 'package:personal_intro/core/widgets/section_label.dart';
import 'package:personal_intro/core/widgets/section_title.dart';
import 'package:personal_intro/data/models/testimonial.dart';
import 'package:personal_intro/presentation/sections/testimonials/testimonial_card.dart';
import 'package:personal_intro/state/providers/portfolio_provider.dart';

class TestimonialsSection extends ConsumerWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final testimonialsAsync = ref.watch(testimonialsProvider);

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
                const SectionLabel(number: '08', name: 'testimonials'),
                const SizedBox(height: AppSpacing.base),
                const SectionTitle('What Clients Say'),
                const SizedBox(height: AppSpacing.xxl),
                testimonialsAsync.when(
                  loading: () => const _LoadingGrid(),
                  error: (_, __) => const SizedBox.shrink(),
                  data: (items) => _TestimonialsGrid(
                    items: items,
                    width: size.width,
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

class _TestimonialsGrid extends StatelessWidget {
  const _TestimonialsGrid({required this.items, required this.width});

  final List<Testimonial> items;
  final double width;

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = Breakpoints.isDesktop(width) ? 3 : 1;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: AppSpacing.gutter,
        crossAxisSpacing: AppSpacing.gutter,
        childAspectRatio: crossAxisCount == 1 ? 1.4 : 0.9,
      ),
      itemCount: items.length,
      itemBuilder: (_, i) => TestimonialCard(testimonial: items[i])
          .animate(delay: AnimationHelpers.stagger(i))
          .fadeIn(duration: AnimationHelpers.slow)
          .slideY(begin: 0.08, end: 0, curve: Curves.easeOut),
    );
  }
}

class _LoadingGrid extends StatelessWidget {
  const _LoadingGrid();

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: AppSpacing.gutter,
        crossAxisSpacing: AppSpacing.gutter,
        childAspectRatio: 1.15,
      ),
      itemCount: 4,
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

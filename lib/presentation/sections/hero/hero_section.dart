import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/social_links.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/animation_helpers.dart';
import '../../../core/widgets/gradient_text.dart';
import '../../../core/widgets/tech_chip.dart';
import 'availability_badge.dart';
import 'phone_mockup_composition.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isDesktop = Breakpoints.isDesktop(size.width);

    return Container(
      constraints: BoxConstraints(minHeight: size.height),
      decoration: const BoxDecoration(
        gradient: AppColors.heroGlow,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
          child: Padding(
            padding: AppSpacing.sectionPadding(size.width),
            child: isDesktop
                ? Row(
                    children: [
                      Expanded(flex: 60, child: _HeroContent()),
                      const Expanded(
                        flex: 40,
                        child: _HeroMockup(),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      _HeroContent(),
                      const SizedBox(height: AppSpacing.xxl),
                      const _HeroMockup(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class _HeroContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AvailabilityBadge()
            .animate()
            .fadeIn(delay: 0.ms, duration: 400.ms),
        const SizedBox(height: AppSpacing.lg),
        // Name
        RichText(
          text: TextSpan(
            style: AppTypography.heroName(),
            children: [
              const TextSpan(text: '${AppStrings.firstName}\n'),
              WidgetSpan(
                child: GradientText(
                  AppStrings.lastName,
                  style: AppTypography.heroName(),
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 100.ms, duration: 600.ms)
            .slideY(begin: 0.3, end: 0),
        const SizedBox(height: AppSpacing.base),
        // Title
        RichText(
          text: TextSpan(
            style: AppTypography.heroSubtitle(),
            children: [
              const TextSpan(text: '${AppStrings.jobTitle} · '),
              TextSpan(
                text: AppStrings.jobTitleAccent,
                style: AppTypography.heroSubtitle(
                  color: AppColors.accentPrimary,
                ),
              ),
            ],
          ),
        )
            .animate()
            .fadeIn(delay: 200.ms, duration: 600.ms)
            .slideY(begin: 0.3, end: 0),
        const SizedBox(height: AppSpacing.lg),
        // Bio
        Text(
          AppStrings.heroBio,
          style: AppTypography.body(),
        )
            .animate()
            .fadeIn(delay: 250.ms, duration: 600.ms),
        const SizedBox(height: AppSpacing.lg),
        // Tech chips
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: AppStrings.heroTechChips
              .asMap()
              .entries
              .map(
                (e) => TechChip(e.value)
                    .animate()
                    .fadeIn(
                      delay: AnimationHelpers.heroChipsDelay +
                          AnimationHelpers.stagger(e.key, baseMs: 50),
                      duration: 400.ms,
                    ),
              )
              .toList(),
        ),
        const SizedBox(height: AppSpacing.xl),
        // CTAs
        Wrap(
          spacing: AppSpacing.base,
          runSpacing: AppSpacing.base,
          children: [
            ElevatedButton(
              onPressed: () => context.go('/projects'),
              child: const Text(AppStrings.heroCtaProjects),
            ),
            OutlinedButton(
              onPressed: () => context.go('/contact'),
              child: const Text(AppStrings.heroCtaContact),
            ),
          ],
        )
            .animate()
            .fadeIn(delay: 500.ms, duration: 400.ms),
        const SizedBox(height: AppSpacing.xl),
        // Social icons
        Row(
          children: SocialLinks.all
              .map(
                (s) => Padding(
                  padding: const EdgeInsets.only(right: AppSpacing.base),
                  child: _SocialIcon(icon: s.icon, label: s.label,url: s.url,),
                ),
              )
              .toList(),
        )
            .animate()
            .fadeIn(delay: 600.ms, duration: 400.ms),
      ],
    );
  }
}

class _HeroMockup extends StatelessWidget {
  const _HeroMockup();

  @override
  Widget build(BuildContext context) {
    return const Center(child: PhoneMockupComposition())
        .animate()
        .fadeIn(delay: 300.ms, duration: 800.ms)
        .slideX(begin: 0.1, end: 0);
  }
}

class _SocialIcon extends StatefulWidget {
  const _SocialIcon({required this.icon, required this.label,required this.url});
  final FaIconData icon;
  final String label;
  final String url;

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

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
        _launchUrl(widget.url);
      },
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: Tooltip(
          message: widget.label,
          child: AnimatedContainer(
            duration: AppDurations.iconHover,
            alignment: Alignment.center,
            width: AppSpacing.socialIconBox,
            height: AppSpacing.socialIconBox,
            decoration: BoxDecoration(
              color: _hovered
                  ? AppColors.accentPrimary.withValues(alpha: 0.1)
                  : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: _hovered
                    ? AppColors.accentPrimary
                    : AppColors.borderSubtle,
              ),
            ),
            child: FaIcon(
              widget.icon,
              size: AppSpacing.socialIconSize,
              color: _hovered
                  ? AppColors.accentPrimary
                  : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

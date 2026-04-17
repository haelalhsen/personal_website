import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_durations.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/presentation/sections/about/about_section.dart';
import 'package:personal_intro/presentation/sections/blog/blog_section.dart';
import 'package:personal_intro/presentation/sections/contact/contact_section.dart';
import 'package:personal_intro/presentation/sections/experience/experience_section.dart';
import 'package:personal_intro/presentation/sections/expertise/expertise_section.dart';
import 'package:personal_intro/presentation/sections/footer/footer_section.dart';
import 'package:personal_intro/presentation/sections/hero/hero_section.dart';
import 'package:personal_intro/presentation/sections/nav/nav_bar.dart';
import 'package:personal_intro/presentation/sections/open_source/open_source_section.dart';
import 'package:personal_intro/presentation/sections/projects/projects_section.dart';
import 'package:personal_intro/presentation/sections/stats/stats_strip.dart';
import 'package:personal_intro/presentation/sections/tech_stack/tech_stack_section.dart';
import 'package:personal_intro/presentation/sections/testimonials/testimonials_section.dart';
import 'package:personal_intro/presentation/shared/scroll_reveal.dart';
import 'package:personal_intro/state/providers/nav_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, this.section});

  final String? section;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _aboutKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _expertiseKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _openSourceKey = GlobalKey();
  final _techStackKey = GlobalKey();
  final _testimonialsKey = GlobalKey();
  final _blogKey = GlobalKey();
  final _contactKey = GlobalKey();

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.section != null) _scrollToSection(widget.section!);
    });
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;
    final offset = _scrollController.offset;
    ref.read(scrollOffsetProvider.notifier).state = offset;
    _updateActiveNav(offset);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(HomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.section != oldWidget.section && widget.section != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToSection(widget.section!);
      });
    }
  }

  // Keys in scroll order — used to auto-highlight the nav
  late final _sectionKeys = [
    _aboutKey,
    _experienceKey,
    _expertiseKey,
    _projectsKey,
    _openSourceKey,
    _contactKey,
  ];

  void _updateActiveNav(double offset) {
    for (var i = _sectionKeys.length - 1; i >= 0; i--) {
      final ctx = _sectionKeys[i].currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null) continue;
      final pos = box.localToGlobal(Offset.zero).dy + offset;
      if (offset >= pos - AppSpacing.navActiveThreshold) {
        ref.read(activeNavIndexProvider.notifier).state = i;
        return;
      }
    }
    ref.read(activeNavIndexProvider.notifier).state = 0;
  }

  void _scrollToSection(String section) {
    final key = switch (section) {
      'about' => _aboutKey,
      'experience' => _experienceKey,
      'expertise' => _expertiseKey,
      'projects' => _projectsKey,
      'open-source' => _openSourceKey,
      'contact' => _contactKey,
      _ => null,
    };
    if (key?.currentContext != null) {
      Scrollable.ensureVisible(
        key!.currentContext!,
        duration: AppDurations.scrollAnimation,
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgPrimary,
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(height: AppSpacing.navHeight),
                // 01 — Hero
                const HeroSection(),
                // Stats strip
                const StatsStrip(),
                // 02 — About
                KeyedSubtree(
                  key: _aboutKey,
                  child: const ScrollReveal(child: AboutSection()),
                ),
                // 03 — Experience
                KeyedSubtree(
                  key: _experienceKey,
                  child: const ScrollReveal(child: ExperienceSection()),
                ),
                // 04 — Expertise
                KeyedSubtree(
                  key: _expertiseKey,
                  child: const ScrollReveal(child: ExpertiseSection()),
                ),
                // 04 — Projects
                KeyedSubtree(
                  key: _projectsKey,
                  child: const ScrollReveal(child: ProjectsSection()),
                ),
                // 05 — Open Source
                KeyedSubtree(
                  key: _openSourceKey,
                  child: const ScrollReveal(child: OpenSourceSection()),
                ),
                // 06 — Tech Stack
                KeyedSubtree(
                  key: _techStackKey,
                  child: const ScrollReveal(child: TechStackSection()),
                ),
                // 07 — Testimonials
                KeyedSubtree(
                  key: _testimonialsKey,
                  child: const ScrollReveal(child: TestimonialsSection()),
                ),
                // 08 — Writing / Blog
                KeyedSubtree(
                  key: _blogKey,
                  child: const ScrollReveal(child: BlogSection()),
                ),
                // 09 — Contact
                KeyedSubtree(
                  key: _contactKey,
                  child: const ScrollReveal(child: ContactSection()),
                ),
                const FooterSection(),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(),
          ),
        ],
      ),
    );
  }
}

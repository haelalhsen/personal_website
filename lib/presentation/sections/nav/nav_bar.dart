import 'dart:js_interop';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:personal_intro/core/constants/app_assets.dart';
import 'package:web/web.dart' as web;
import '../../../core/constants/app_strings.dart';
import '../../../core/responsive/breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_durations.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../state/providers/nav_provider.dart';
import 'mobile_drawer.dart';

const _navScrolledThreshold = 80.0;
const _navBlurSigma = 20.0;
const _navBackgroundAlpha = 0.9;
const _logoFontSize = 16.0;

const _navItems = [
  (label: AppStrings.navAbout, section: 'about', index: 0),
  (label: AppStrings.navExperience, section: 'experience', index: 1),
  (label: AppStrings.navExpertise, section: 'expertise', index: 2),
  (label: AppStrings.navProjects, section: 'projects', index: 3),
  (label: AppStrings.navOpenSource, section: 'open-source', index: 4),
  (label: AppStrings.navContact, section: 'contact', index: 5),
];

class NavBar extends ConsumerWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollOffset = ref.watch(scrollOffsetProvider);
    final activeIndex = ref.watch(activeNavIndexProvider);
    final isScrolled = scrollOffset > _navScrolledThreshold;

    return AnimatedContainer(
      duration: AppDurations.cardHover,
      height: AppSpacing.navHeight,
      decoration: BoxDecoration(
        color: isScrolled
            ? AppColors.bgSurface.withValues(alpha: _navBackgroundAlpha)
            : Colors.transparent,
        border: isScrolled
            ? const Border(
                bottom: BorderSide(color: AppColors.borderSubtle),
              )
            : null,
      ),
      child: isScrolled
          ? ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: _navBlurSigma,
                  sigmaY: _navBlurSigma,
                ),
                child: _NavContent(
                  activeIndex: activeIndex,
                  ref: ref,
                ),
              ),
            )
          : _NavContent(activeIndex: activeIndex, ref: ref),
    );
  }
}

class _NavContent extends StatelessWidget {
  const _NavContent({required this.activeIndex, required this.ref});

  final int activeIndex;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    final isMobileOrTab =
        !Breakpoints.isDesktop(MediaQuery.sizeOf(context).width);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xxxl),
      child: Row(
        children: [
          // Logo
          RichText(
            text: TextSpan(
              style: AppTypography.mono(color: AppColors.textPrimary)
                  .copyWith(fontSize: _logoFontSize),
              children: const [
                TextSpan(
                  text: '{ ',
                  style: TextStyle(color: AppColors.accentPrimary),
                ),
                TextSpan(text: AppStrings.logoInitials),
                TextSpan(
                  text: ' }',
                  style: TextStyle(color: AppColors.accentPrimary),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (isMobileOrTab)
            IconButton(
              icon: const Icon(Icons.menu, color: AppColors.textPrimary),
              onPressed: () {
                showDialog<void>(
                  context: context,
                  builder: (_) => MobileDrawer(
                    activeIndex: activeIndex,
                    onItemTapped: (index) {
                      ref.read(activeNavIndexProvider.notifier).state = index;
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            )
          else
            Row(
              children: [
                ..._navItems.map(
                  (item) => _NavLink(
                    label: item.label,
                    isActive: activeIndex == item.index,
                    onTap: () {
                      ref.read(activeNavIndexProvider.notifier).state =
                          item.index;
                      context.go('/${item.section}');
                    },
                  ),
                ),
                const SizedBox(width: AppSpacing.lg),
                _DownloadCVButton(),
              ],
            ),
        ],
      ),
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isActive || _hovered
        ? AppColors.accentPrimary
        : AppColors.textSecondary;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.base,
            vertical: AppSpacing.sm,
          ),
          child: AnimatedDefaultTextStyle(
            duration: AppDurations.iconHover,
            style: AppTypography.navLink(color: color),
            child: Text(widget.label),
          ),
        ),
      ),
    );
  }
}

class _DownloadCVButton extends StatefulWidget {
  @override
  State<_DownloadCVButton> createState() => _DownloadCVButtonState();
}

class _DownloadCVButtonState extends State<_DownloadCVButton> {
  bool _hovered = false;

  Future<void> downloadFile(String assetPath, String fileName) async {
    // 1. Load the file bytes from assets
    final data = await rootBundle.load(assetPath);
    final bytes = data.buffer.asUint8List();

    // 2. Create a Blob from the bytes
    // Note: we convert the Uint8List to a JS-compatible array
    final blob = web.Blob([bytes.toJS].toJS);

    // 3. Create an object URL for the Blob
    final url = web.URL.createObjectURL(blob);

    // 4. Create a hidden anchor element to trigger the download
    final anchor = web.document.createElement('a') as web.HTMLAnchorElement
      ..href = url
      ..download = fileName;

    web.document.body?.append(anchor);
    anchor
      ..click()
      ..remove();
    web.URL.revokeObjectURL(url);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => downloadFile(AppAssets.myCv, 'Hael_CV.pdf'),
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        child: AnimatedContainer(
          duration: AppDurations.cardHover,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.base,
            vertical: AppSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: _hovered ? AppColors.accentPrimary : Colors.transparent,
            borderRadius: BorderRadius.circular(AppSpacing.radiusButton),
            border: Border.all(color: AppColors.accentPrimary),
          ),
          child: Text(
            AppStrings.navDownloadCv,
            style: AppTypography.navLink(
              color: _hovered ? AppColors.bgPrimary : AppColors.accentPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

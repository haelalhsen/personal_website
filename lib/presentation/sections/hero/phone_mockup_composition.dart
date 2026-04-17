import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/device_mockup.dart';

/// Two overlapping phone frames used in the hero section right column.
class PhoneMockupComposition extends StatelessWidget {
  const PhoneMockupComposition({super.key});

  @override
  Widget build(BuildContext context) {
    return const RepaintBoundary(
      child: SizedBox(
        width: AppSpacing.heroPhoneStackWidth,
        height: AppSpacing.heroPhoneStackHeight,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            _BackPhone(),
            _FrontPhone(),
          ],
        ),
      ),
    );
  }
}

class _BackPhone extends StatelessWidget {
  const _BackPhone();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: AppSpacing.heroPhoneBackTop,
      child: Transform.rotate(
        angle: 0.08,
        child: const DeviceMockup(
          width: AppSpacing.heroPhoneBackWidth,
          child: _PlaceholderScreen(),
        ),
      ),
    );
  }
}

class _FrontPhone extends StatelessWidget {
  const _FrontPhone();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Transform.rotate(
        angle: -0.04,
        child: const DeviceMockup(
          width: AppSpacing.heroPhoneFrontWidth,
          child: _PlaceholderScreenFront(),
        ),
      ),
    );
  }
}

class _PlaceholderScreenFront extends StatelessWidget {
  const _PlaceholderScreenFront();

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: AppAssets.heroImage,
      fit: BoxFit.cover,
      width: double.infinity,
      height: double.infinity,
      placeholder: (context, url) => const ColoredBox(
        color: AppColors.bgSurface,
        child: Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => const ColoredBox(
        color: AppColors.bgSurface,
        child: Center(child: Icon(Icons.error)),
      ),
    );
  }
}

class _PlaceholderScreen extends StatelessWidget {
  const _PlaceholderScreen();

  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: AppColors.accentDeep,
      child: Center(
        child: Icon(
          Icons.phone_android,
          color: AppColors.borderAccent,
          size: AppSpacing.iconLg,
        ),
      ),
    );
  }
}

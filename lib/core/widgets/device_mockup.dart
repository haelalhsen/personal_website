import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';

/// Phone frame wrapper for screenshots.
class DeviceMockup extends StatelessWidget {
  const DeviceMockup({
    required this.child,
    super.key,
    this.width = 280,
  });

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    final height = width * 2.0;
    const cornerRadius = AppSpacing.deviceCornerRadius;
    const innerRadius = cornerRadius - AppSpacing.borderMedium;
    const screenRadius = cornerRadius - AppSpacing.deviceBezel;

    return RepaintBoundary(
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.bgElevated,
          borderRadius: BorderRadius.circular(cornerRadius),
          border: Border.all(
            color: AppColors.borderAccent,
            width: AppSpacing.borderMedium,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              blurRadius: AppSpacing.deviceShadowBlur,
              offset: const Offset(0, AppSpacing.deviceShadowOffsetY),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(innerRadius),
          child: Stack(
            children: [
              // Screen content
              Padding(
                padding: const EdgeInsets.all(AppSpacing.deviceBezel),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenRadius),
                  child: child,
                ),
              ),
              // Notch
              Positioned(
                top: AppSpacing.deviceBezel,
                left: (width - AppSpacing.deviceNotchWidth) / 2,
                child: Container(
                  width: AppSpacing.deviceNotchWidth,
                  height: AppSpacing.deviceNotchHeight,
                  decoration: const BoxDecoration(
                    color: AppColors.bgElevated,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(AppSpacing.radiusTag),
                      bottomRight: Radius.circular(AppSpacing.radiusTag),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

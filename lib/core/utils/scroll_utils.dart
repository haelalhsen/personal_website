import 'package:flutter/material.dart';
import '../theme/app_durations.dart';

abstract final class ScrollUtils {
  static Future<void> scrollTo(
    ScrollController controller,
    double offset, {
    Duration duration = AppDurations.scrollAnimation,
    Curve curve = Curves.easeInOutCubic,
  }) async {
    await controller.animateTo(
      offset,
      duration: duration,
      curve: curve,
    );
  }

  static void scrollToKey(
    ScrollController controller,
    GlobalKey key, {
    double offset = 0,
  }) {
    final context = key.currentContext;
    if (context == null) return;
    Scrollable.ensureVisible(
      context,
      duration: AppDurations.scrollAnimation,
      curve: Curves.easeInOutCubic,
    );
  }
}

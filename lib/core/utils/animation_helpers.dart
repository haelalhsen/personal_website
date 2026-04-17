import 'package:flutter/material.dart';

abstract final class AnimationHelpers {
  /// Stagger delay for the Nth item.
  static Duration stagger(int index, {int baseMs = 100}) =>
      Duration(milliseconds: index * baseMs);

  /// Spring-like curve for entrance animations.
  static const Curve springCurve = Curves.easeOutBack;

  /// Standard ease-out for most transitions.
  static const Curve standardCurve = Curves.easeOut;

  /// Durations
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration medium = Duration(milliseconds: 300);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration verySlow = Duration(milliseconds: 800);

  /// Page load animation delays (hero sequence)
  static const Duration navDelay = Duration.zero;
  static const Duration heroNameDelay = Duration(milliseconds: 100);
  static const Duration heroSubtitleDelay = Duration(milliseconds: 200);
  static const Duration heroChipsDelay = Duration(milliseconds: 350);
  static const Duration heroCTADelay = Duration(milliseconds: 500);
  static const Duration heroMockupDelay = Duration(milliseconds: 300);
}

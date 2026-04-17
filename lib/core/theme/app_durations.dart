/// Central registry for animation / timing durations.
/// No widget may declare a `Duration(milliseconds: N)` literal — use these.
abstract final class AppDurations {
  // Hover / micro-interaction
  static const Duration fadeQuick = Duration(milliseconds: 100);
  static const Duration iconHover = Duration(milliseconds: 150);
  static const Duration cardHover = Duration(milliseconds: 200);

  // Content reveal
  static const Duration scrollReveal = Duration(milliseconds: 500);
  static const Duration scrollAnimation = Duration(milliseconds: 600);

  // Stats count-up
  static const Duration countUp = Duration(milliseconds: 1200);

  // Terminal cursor blink
  static const Duration cursorBlink = Duration(milliseconds: 530);

  // Availability pulse cycle
  static const Duration pulseCycle = Duration(seconds: 2);

  // Contact form submit simulation
  static const Duration submitDelay = Duration(seconds: 1);
}

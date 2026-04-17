import 'package:flutter/material.dart';
import 'breakpoints.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.builder,
    super.key,
  });

  final Widget Function(BuildContext context, Breakpoint breakpoint) builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final breakpoint = Breakpoints.of(constraints.maxWidth);
        return builder(context, breakpoint);
      },
    );
  }
}

/// Convenience extension on BuildContext for quick breakpoint access.
extension ResponsiveContext on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  Breakpoint get breakpoint => Breakpoints.of(screenWidth);
  bool get isMobile => breakpoint == Breakpoint.mobile;
  bool get isTablet => breakpoint == Breakpoint.tablet;
  bool get isDesktop =>
      breakpoint == Breakpoint.desktop || breakpoint == Breakpoint.wide;
  bool get isWide => breakpoint == Breakpoint.wide;
}

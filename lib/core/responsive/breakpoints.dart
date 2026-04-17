enum Breakpoint { mobile, tablet, desktop, wide }

abstract final class Breakpoints {
  static const double mobile = 640;
  static const double tablet = 1024;
  static const double desktop = 1280;

  static Breakpoint of(double width) {
    if (width < mobile) return Breakpoint.mobile;
    if (width < tablet) return Breakpoint.tablet;
    if (width < desktop) return Breakpoint.desktop;
    return Breakpoint.wide;
  }

  static bool isMobile(double width) => width < mobile;
  static bool isTablet(double width) => width >= mobile && width < tablet;
  static bool isDesktop(double width) => width >= tablet;
  static bool isWide(double width) => width >= desktop;
}

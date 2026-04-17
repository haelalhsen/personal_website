import 'breakpoints.dart';

/// Selects a typed value based on the current [Breakpoint].
///
/// Usage:
/// ```dart
/// final columns = ResponsiveValue(
///   mobile: 1,
///   tablet: 2,
///   desktop: 3,
/// ).resolve(breakpoint);
/// ```
class ResponsiveValue<T> {
  const ResponsiveValue({
    required this.mobile,
    T? tablet,
    T? desktop,
    T? wide,
  })  : _tablet = tablet,
        _desktop = desktop,
        _wide = wide;

  final T mobile;
  final T? _tablet;
  final T? _desktop;
  final T? _wide;

  T resolve(Breakpoint breakpoint) {
    return switch (breakpoint) {
      Breakpoint.mobile => mobile,
      Breakpoint.tablet => _tablet ?? mobile,
      Breakpoint.desktop => _desktop ?? _tablet ?? mobile,
      Breakpoint.wide => _wide ?? _desktop ?? _tablet ?? mobile,
    };
  }
}

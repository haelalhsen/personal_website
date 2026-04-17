import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tracks which section index is currently active (for nav highlight).
final activeNavIndexProvider = StateProvider<int>((ref) => 0);

/// Tracks current scroll offset (used for nav transparency/blur effect).
final scrollOffsetProvider = StateProvider<double>((ref) => 0);

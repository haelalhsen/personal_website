import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:personal_intro/core/theme/app_theme.dart';
import 'package:personal_intro/presentation/home_page.dart';

void main() {
  testWidgets('HomePage renders without crashing', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.dark,
          home: const HomePage(),
        ),
      ),
    );
    await tester.pump();
  });
}

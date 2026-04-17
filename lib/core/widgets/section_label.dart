import 'package:flutter/material.dart';
import '../theme/app_typography.dart';

/// Renders the `// 0N section-name` prefix label in JetBrains Mono 13px.
class SectionLabel extends StatelessWidget {
  const SectionLabel({
    required this.number,
    required this.name,
    super.key,
  });

  final String number;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      '// $number $name',
      style: AppTypography.sectionLabel(),
    );
  }
}

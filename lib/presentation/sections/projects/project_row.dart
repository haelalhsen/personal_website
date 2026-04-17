import 'package:flutter/material.dart';
import 'package:personal_intro/core/responsive/breakpoints.dart';
import 'package:personal_intro/core/theme/app_colors.dart';
import 'package:personal_intro/core/theme/app_durations.dart';
import 'package:personal_intro/core/theme/app_spacing.dart';
import 'package:personal_intro/core/theme/app_typography.dart';
import 'package:personal_intro/core/widgets/tech_chip.dart';
import 'package:personal_intro/data/models/project.dart';

const _projectShadowBlur = 32.0;

class ProjectRow extends StatefulWidget {
  const ProjectRow({
    required this.project,
    required this.index,
    super.key,
  });

  final Project project;
  final int index;

  @override
  State<ProjectRow> createState() => _ProjectRowState();
}

class _ProjectRowState extends State<ProjectRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isDesktop = Breakpoints.isDesktop(width);
    // Alternate: even index → mockup left, odd → mockup right
    final mockupFirst = widget.index.isEven;

    final mockup = _ProjectMockup(project: widget.project);
    final content = _ProjectContent(project: widget.project);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: AppDurations.cardHover,
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: AppColors.bgSurface,
          borderRadius: BorderRadius.circular(AppSpacing.radiusCard),
          border: Border.all(
            color: _hovered ? AppColors.accentPrimary : AppColors.borderSubtle,
          ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppColors.accentPrimary.withValues(alpha: 0.08),
                    blurRadius: _projectShadowBlur,
                    offset: const Offset(0, AppSpacing.cardShadowOffsetY),
                  ),
                ]
              : const [],
        ),
        child: isDesktop
            ? Row(
                children: [
                  if (mockupFirst) ...[
                    Expanded(child: mockup),
                    const SizedBox(width: AppSpacing.xxxl),
                    Expanded(child: content),
                  ] else ...[
                    Expanded(child: content),
                    const SizedBox(width: AppSpacing.xxxl),
                    Expanded(child: mockup),
                  ],
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  mockup,
                  const SizedBox(height: AppSpacing.xl),
                  content,
                ],
              ),
      ),
    );
  }
}

class _ProjectMockup extends StatelessWidget {
  const _ProjectMockup({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSpacing.radiusImage),
      child: Image.asset(
        project.image,
        fit: BoxFit.cover,
      ),
    );
  }
}

class _ProjectContent extends StatelessWidget {
  const _ProjectContent({required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.xl,
        horizontal: AppSpacing.md,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Subtitle
          Text(project.subtitle, style: AppTypography.mono()),
          const SizedBox(height: AppSpacing.sm),
          // Title
          Text(project.title, style: AppTypography.sectionTitle()),
          const SizedBox(height: AppSpacing.base),
          // Description
          Text(project.description, style: AppTypography.body()),
          const SizedBox(height: AppSpacing.base),
          // Tech tags
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children:
                project.tags.map((t) => TechChip(t, small: true)).toList(),
          ),
          const SizedBox(height: AppSpacing.lg),
          // Metrics row
          Wrap(
            spacing: AppSpacing.lg,
            runSpacing: AppSpacing.sm,
            children: project.metrics.map(_MetricBadge.new).toList(),
          ),
        ],
      ),
    );
  }
}

class _MetricBadge extends StatelessWidget {
  const _MetricBadge(this.metric);

  final ProjectMetric metric;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(metric.value, style: AppTypography.metricValue()),
        Text(metric.label, style: AppTypography.statsLabel()),
      ],
    );
  }
}

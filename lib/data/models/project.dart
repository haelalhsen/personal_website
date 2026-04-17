import 'package:freezed_annotation/freezed_annotation.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class ProjectMetric with _$ProjectMetric {
  const factory ProjectMetric({
    required String label,
    required String value,
  }) = _ProjectMetric;

  factory ProjectMetric.fromJson(Map<String, dynamic> json) =>
      _$ProjectMetricFromJson(json);
}

@freezed
class Project with _$Project {
  const factory Project({
    required String id,
    required String title,
    required String subtitle,
    required String description,
    required List<String> tags,
    required List<ProjectMetric> metrics,
    required String mockupColor,
    required String url,
    @Default('') String image,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

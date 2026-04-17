// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectMetricImpl _$$ProjectMetricImplFromJson(Map<String, dynamic> json) =>
    _$ProjectMetricImpl(
      label: json['label'] as String,
      value: json['value'] as String,
    );

Map<String, dynamic> _$$ProjectMetricImplToJson(_$ProjectMetricImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
    };

_$ProjectImpl _$$ProjectImplFromJson(Map<String, dynamic> json) =>
    _$ProjectImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      metrics: (json['metrics'] as List<dynamic>)
          .map((e) => ProjectMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      mockupColor: json['mockupColor'] as String,
      url: json['url'] as String,
      image: json['image'] as String? ?? '',
    );

Map<String, dynamic> _$$ProjectImplToJson(_$ProjectImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'description': instance.description,
      'tags': instance.tags,
      'metrics': instance.metrics,
      'mockupColor': instance.mockupColor,
      'url': instance.url,
      'image': instance.image,
    };

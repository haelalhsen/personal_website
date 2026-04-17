// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expertise.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpertiseImpl _$$ExpertiseImplFromJson(Map<String, dynamic> json) =>
    _$ExpertiseImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      icon: json['icon'] as String,
      description: json['description'] as String,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ExpertiseImplToJson(_$ExpertiseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'icon': instance.icon,
      'description': instance.description,
      'tags': instance.tags,
    };

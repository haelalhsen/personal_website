// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'skill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SkillImpl _$$SkillImplFromJson(Map<String, dynamic> json) => _$SkillImpl(
      name: json['name'] as String,
      level: json['level'] as String,
    );

Map<String, dynamic> _$$SkillImplToJson(_$SkillImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'level': instance.level,
    };

_$SkillCategoryImpl _$$SkillCategoryImplFromJson(Map<String, dynamic> json) =>
    _$SkillCategoryImpl(
      title: json['title'] as String,
      skills: (json['skills'] as List<dynamic>)
          .map((e) => Skill.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SkillCategoryImplToJson(_$SkillCategoryImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'skills': instance.skills,
    };

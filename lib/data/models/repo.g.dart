// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RepoImpl _$$RepoImplFromJson(Map<String, dynamic> json) => _$RepoImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      stars: (json['stars'] as num).toInt(),
      language: json['language'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$RepoImplToJson(_$RepoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'stars': instance.stars,
      'language': instance.language,
      'url': instance.url,
    };

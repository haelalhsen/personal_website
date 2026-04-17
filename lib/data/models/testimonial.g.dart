// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonial.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestimonialImpl _$$TestimonialImplFromJson(Map<String, dynamic> json) =>
    _$TestimonialImpl(
      id: json['id'] as String,
      quote: json['quote'] as String,
      author: json['author'] as String,
      role: json['role'] as String,
      rating: (json['rating'] as num).toInt(),
    );

Map<String, dynamic> _$$TestimonialImplToJson(_$TestimonialImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'quote': instance.quote,
      'author': instance.author,
      'role': instance.role,
      'rating': instance.rating,
    };

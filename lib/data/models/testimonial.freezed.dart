// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'testimonial.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Testimonial _$TestimonialFromJson(Map<String, dynamic> json) {
  return _Testimonial.fromJson(json);
}

/// @nodoc
mixin _$Testimonial {
  String get id => throw _privateConstructorUsedError;
  String get quote => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  int get rating => throw _privateConstructorUsedError;

  /// Serializes this Testimonial to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Testimonial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TestimonialCopyWith<Testimonial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TestimonialCopyWith<$Res> {
  factory $TestimonialCopyWith(
          Testimonial value, $Res Function(Testimonial) then) =
      _$TestimonialCopyWithImpl<$Res, Testimonial>;
  @useResult
  $Res call({String id, String quote, String author, String role, int rating});
}

/// @nodoc
class _$TestimonialCopyWithImpl<$Res, $Val extends Testimonial>
    implements $TestimonialCopyWith<$Res> {
  _$TestimonialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Testimonial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quote = null,
    Object? author = null,
    Object? role = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TestimonialImplCopyWith<$Res>
    implements $TestimonialCopyWith<$Res> {
  factory _$$TestimonialImplCopyWith(
          _$TestimonialImpl value, $Res Function(_$TestimonialImpl) then) =
      __$$TestimonialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String quote, String author, String role, int rating});
}

/// @nodoc
class __$$TestimonialImplCopyWithImpl<$Res>
    extends _$TestimonialCopyWithImpl<$Res, _$TestimonialImpl>
    implements _$$TestimonialImplCopyWith<$Res> {
  __$$TestimonialImplCopyWithImpl(
      _$TestimonialImpl _value, $Res Function(_$TestimonialImpl) _then)
      : super(_value, _then);

  /// Create a copy of Testimonial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quote = null,
    Object? author = null,
    Object? role = null,
    Object? rating = null,
  }) {
    return _then(_$TestimonialImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      quote: null == quote
          ? _value.quote
          : quote // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TestimonialImpl implements _Testimonial {
  const _$TestimonialImpl(
      {required this.id,
      required this.quote,
      required this.author,
      required this.role,
      required this.rating});

  factory _$TestimonialImpl.fromJson(Map<String, dynamic> json) =>
      _$$TestimonialImplFromJson(json);

  @override
  final String id;
  @override
  final String quote;
  @override
  final String author;
  @override
  final String role;
  @override
  final int rating;

  @override
  String toString() {
    return 'Testimonial(id: $id, quote: $quote, author: $author, role: $role, rating: $rating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TestimonialImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quote, quote) || other.quote == quote) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, quote, author, role, rating);

  /// Create a copy of Testimonial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TestimonialImplCopyWith<_$TestimonialImpl> get copyWith =>
      __$$TestimonialImplCopyWithImpl<_$TestimonialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TestimonialImplToJson(
      this,
    );
  }
}

abstract class _Testimonial implements Testimonial {
  const factory _Testimonial(
      {required final String id,
      required final String quote,
      required final String author,
      required final String role,
      required final int rating}) = _$TestimonialImpl;

  factory _Testimonial.fromJson(Map<String, dynamic> json) =
      _$TestimonialImpl.fromJson;

  @override
  String get id;
  @override
  String get quote;
  @override
  String get author;
  @override
  String get role;
  @override
  int get rating;

  /// Create a copy of Testimonial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TestimonialImplCopyWith<_$TestimonialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

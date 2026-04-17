import 'package:freezed_annotation/freezed_annotation.dart';

part 'expertise.freezed.dart';
part 'expertise.g.dart';

@freezed
class Expertise with _$Expertise {
  const factory Expertise({
    required String id,
    required String title,
    required String icon,
    required String description,
    required List<String> tags,
  }) = _Expertise;

  factory Expertise.fromJson(Map<String, dynamic> json) =>
      _$ExpertiseFromJson(json);
}

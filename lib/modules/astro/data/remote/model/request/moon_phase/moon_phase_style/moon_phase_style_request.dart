import 'package:json_annotation/json_annotation.dart';

part 'moon_phase_style_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MoonPhaseStyleRequest {
  MoonPhaseStyleRequest({
    required this.moonStyle,
    required this.backgroundStyle,
    required this.backgroundColor,
    required this.headingColor,
    required this.textColor,
  });

  factory MoonPhaseStyleRequest.fromJson(Map<String, dynamic> json) =>
      _$MoonPhaseStyleRequestFromJson(json);

  final String moonStyle;
  final String backgroundStyle;
  final String backgroundColor;
  final String headingColor;
  final String textColor;

  Map<String, dynamic> toJson() => _$MoonPhaseStyleRequestToJson(this);
}

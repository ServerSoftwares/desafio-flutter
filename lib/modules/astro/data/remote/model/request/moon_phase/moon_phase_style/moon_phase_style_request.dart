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

  @JsonKey(name: 'moonStyle')
  final String moonStyle;
  @JsonKey(name: 'backgroundStyle')
  final String backgroundStyle;
  @JsonKey(name: 'backgroundColor')
  final String backgroundColor;
  @JsonKey(name: 'headingColor')
  final String headingColor;
  @JsonKey(name: 'textColor')
  final String textColor;

  Map<String, dynamic> toJson() => _$MoonPhaseStyleRequestToJson(this);
}

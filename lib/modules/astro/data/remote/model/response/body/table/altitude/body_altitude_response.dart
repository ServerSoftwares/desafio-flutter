import 'package:json_annotation/json_annotation.dart';

part 'body_altitude_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyAltitudeResponse {
  BodyAltitudeResponse({
    this.degrees,
    this.string,
  });

  factory BodyAltitudeResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyAltitudeResponseFromJson(json);

  final String? degrees;
  final String? string;

  Map<String, dynamic> toJson() => _$BodyAltitudeResponseToJson(this);
}

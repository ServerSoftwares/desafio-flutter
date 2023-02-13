import 'package:json_annotation/json_annotation.dart';

import '../altitude/body_altitude_response.dart';

part 'body_position_horizonal_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)

class BodyPositionHorizonalResponse {
  BodyPositionHorizonalResponse({
    this.altitude,
  });

  factory BodyPositionHorizonalResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyPositionHorizonalResponseFromJson(json);

  final BodyAltitudeResponse? altitude;

  Map<String, dynamic> toJson() => _$BodyPositionHorizonalResponseToJson(this);
}

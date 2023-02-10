import 'package:json_annotation/json_annotation.dart';

import 'body_position_horizonal_response.dart';

part 'body_position_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyPositionResponse {
  BodyPositionResponse({
    this.horizonal,
  });

  factory BodyPositionResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyPositionResponseFromJson(json);

  final BodyPositionHorizonalResponse? horizonal;

  Map<String, dynamic> toJson() => _$BodyPositionResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'body_distance_from_earth_response.dart';

part 'body_distance_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyDistanceResponse {
  BodyDistanceResponse({
    this.fromEarth,
  });

  factory BodyDistanceResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyDistanceResponseFromJson(json);

  final BodyDistanceFromEarthResponse? fromEarth;

  Map<String, dynamic> toJson() => _$BodyDistanceResponseToJson(this);
}

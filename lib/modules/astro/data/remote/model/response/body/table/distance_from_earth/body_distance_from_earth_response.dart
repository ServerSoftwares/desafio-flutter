import 'package:json_annotation/json_annotation.dart';

part 'body_distance_from_earth_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyDistanceFromEarthResponse {
  BodyDistanceFromEarthResponse({
    this.km,
  });

  factory BodyDistanceFromEarthResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyDistanceFromEarthResponseFromJson(json);

  final String? km;

  Map<String, dynamic> toJson() => _$BodyDistanceFromEarthResponseToJson(this);
}

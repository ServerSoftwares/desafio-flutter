import 'package:json_annotation/json_annotation.dart';

part 'body_location_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyLocationResponse {
  BodyLocationResponse({
    this.longitude,
    this.latitude,
    this.elevation,
  });

  factory BodyLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyLocationResponseFromJson(json);

  final double? longitude;
  final double? latitude;
  final int? elevation;

  Map<String, dynamic> toJson() => _$BodyLocationResponseToJson(this);
}

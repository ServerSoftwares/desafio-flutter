import 'package:json_annotation/json_annotation.dart';

part 'body_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyRequest {
  BodyRequest({
    required this.latitude,
    required this.longitude,
    required this.fromDate,
    required this.toDate,
    required this.time,
    required this.elevation,
  });

  factory BodyRequest.fromJson(Map<String, dynamic> json) =>
      _$BodyRequestFromJson(json);

  final double latitude;
  final double longitude;
  @JsonKey(name: 'from_date')
  final String fromDate;
  @JsonKey(name: 'to_date')
  final String toDate;
  final String time;
  final double elevation;

  Map<String, dynamic> toJson() => _$BodyRequestToJson(this);
}

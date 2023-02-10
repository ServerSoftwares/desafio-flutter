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
  });

  factory BodyRequest.fromJson(Map<String, dynamic> json) =>
      _$BodyRequestFromJson(json);

  final String latitude;
  final String longitude;
  final String fromDate;
  final String toDate;
  final String time;

  Map<String, dynamic> toJson() => _$BodyRequestToJson(this);
}

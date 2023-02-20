import 'package:json_annotation/json_annotation.dart';

part 'observer_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ObserverRequest {
  ObserverRequest({
    required this.latitude,
    required this.longitude,
    required this.date,
  });

  factory ObserverRequest.fromJson(Map<String, dynamic> json) =>
      _$ObserverRequestFromJson(json);

  final double latitude;
  final double longitude;
  final String date;

  Map<String, dynamic> toJson() => _$ObserverRequestToJson(this);
}

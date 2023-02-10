import 'package:json_annotation/json_annotation.dart';

part 'body_dates_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyDatesResponse {
  BodyDatesResponse({
    this.from,
    this.to,
  });

  factory BodyDatesResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyDatesResponseFromJson(json);

  final String? from;
  final String? to;

  Map<String, dynamic> toJson() => _$BodyDatesResponseToJson(this);
}

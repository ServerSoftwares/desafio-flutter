import 'package:json_annotation/json_annotation.dart';

part 'body_list_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyListResponse {
  BodyListResponse({
    this.bodies,
  });

  factory BodyListResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyListResponseFromJson(json);

  final List<String>? bodies;

  Map<String, dynamic> toJson() => _$BodyListResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import '../details_data/body_details_data_response.dart';

part 'body_details_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyDetailsResponse {
  BodyDetailsResponse({
    this.data,
  });

  factory BodyDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyDetailsResponseFromJson(json);

  final BodyDetailsDataResponse? data;

  Map<String, dynamic> toJson() => _$BodyDetailsResponseToJson(this);
}

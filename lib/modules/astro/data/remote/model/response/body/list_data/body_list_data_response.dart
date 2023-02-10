import 'package:json_annotation/json_annotation.dart';

import '../list/body_list_response.dart';

part 'body_list_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)

class BodyListDataResponse {
  BodyListDataResponse({
    this.data,
  });

  factory BodyListDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyListDataResponseFromJson(json);

  final BodyListResponse? data;

  Map<String, dynamic> toJson() => _$BodyListDataResponseToJson(this);
}

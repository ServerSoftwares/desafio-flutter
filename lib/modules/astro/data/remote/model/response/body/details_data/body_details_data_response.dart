import 'package:json_annotation/json_annotation.dart';

import '../table/body_table_response.dart';

part 'body_details_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyDetailsDataResponse {
  BodyDetailsDataResponse({
    this.table,
  });

  factory BodyDetailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyDetailsDataResponseFromJson(json);

  final BodyTableResponse? table;

  Map<String, dynamic> toJson() => _$BodyDetailsDataResponseToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'rows/body_table_rows_response.dart';

part 'body_table_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyTableResponse {
  BodyTableResponse({
    this.rows,
  });

  factory BodyTableResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyTableResponseFromJson(json);

  final List<BodyTableRowsResponse>? rows;

  Map<String, dynamic> toJson() => _$BodyTableResponseToJson(this);
}

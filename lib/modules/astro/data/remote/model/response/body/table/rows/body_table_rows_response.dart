import 'package:json_annotation/json_annotation.dart';

import '../cells/body_table_cells_response.dart';
import '../entry/body_table_entry_response.dart';

part 'body_table_rows_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyTableRowsResponse {
  BodyTableRowsResponse({
    this.cells,
    this.entry,
  });

  factory BodyTableRowsResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyTableRowsResponseFromJson(json);

  final List<BodyTableCellsResponse>? cells;
  final BodyTableEntryResponse? entry;

  Map<String, dynamic> toJson() => _$BodyTableRowsResponseToJson(this);
}

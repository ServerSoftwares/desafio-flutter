import 'package:json_annotation/json_annotation.dart';

import '../distance_from_earth/body_distance_response.dart';
import '../position/body_position_response.dart';

part 'body_table_cells_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyTableCellsResponse {
  BodyTableCellsResponse({
    this.date,
    this.distance,
    this.position,
  });

  factory BodyTableCellsResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyTableCellsResponseFromJson(json);

  final String? date;
  final BodyDistanceResponse? distance;
  final BodyPositionResponse? position;

  Map<String, dynamic> toJson() => _$BodyTableCellsResponseToJson(this);
}

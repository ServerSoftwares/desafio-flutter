import 'package:json_annotation/json_annotation.dart';

part 'body_table_entry_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyTableEntryResponse {
  BodyTableEntryResponse({this.id, this.name});

  factory BodyTableEntryResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyTableEntryResponseFromJson(json);

  final String? id;
  final String? name;

  Map<String, dynamic> toJson() => _$BodyTableEntryResponseToJson(this);
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_table_rows_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyTableRowsResponse _$BodyTableRowsResponseFromJson(
        Map<String, dynamic> json) =>
    BodyTableRowsResponse(
      cells: (json['cells'] as List<dynamic>?)
          ?.map(
              (e) => BodyTableCellsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BodyTableRowsResponseToJson(
        BodyTableRowsResponse instance) =>
    <String, dynamic>{
      'cells': instance.cells,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_table_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyTableResponse _$BodyTableResponseFromJson(Map<String, dynamic> json) =>
    BodyTableResponse(
      header:
          (json['header'] as List<dynamic>?)?.map((e) => e as String).toList(),
      rows: (json['rows'] as List<dynamic>?)
          ?.map(
              (e) => BodyTableRowsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BodyTableResponseToJson(BodyTableResponse instance) =>
    <String, dynamic>{
      'header': instance.header,
      'rows': instance.rows,
    };

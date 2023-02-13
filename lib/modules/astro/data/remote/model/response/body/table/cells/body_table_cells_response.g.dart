// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_table_cells_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyTableCellsResponse _$BodyTableCellsResponseFromJson(
        Map<String, dynamic> json) =>
    BodyTableCellsResponse(
      date: json['date'] as String?,
      distance: json['distance'] == null
          ? null
          : BodyDistanceResponse.fromJson(
              json['distance'] as Map<String, dynamic>),
      position: json['position'] == null
          ? null
          : BodyPositionResponse.fromJson(
              json['position'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyTableCellsResponseToJson(
        BodyTableCellsResponse instance) =>
    <String, dynamic>{
      'date': instance.date,
      'distance': instance.distance,
      'position': instance.position,
    };

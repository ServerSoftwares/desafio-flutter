// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_details_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyDetailsDataResponse _$BodyDetailsDataResponseFromJson(
        Map<String, dynamic> json) =>
    BodyDetailsDataResponse(
      table: json['table'] == null
          ? null
          : BodyTableResponse.fromJson(json['table'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyDetailsDataResponseToJson(
        BodyDetailsDataResponse instance) =>
    <String, dynamic>{
      'table': instance.table,
    };

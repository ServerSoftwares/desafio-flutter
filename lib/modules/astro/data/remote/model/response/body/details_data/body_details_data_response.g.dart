// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_details_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyDetailsDataResponse _$BodyDetailsDataResponseFromJson(
        Map<String, dynamic> json) =>
    BodyDetailsDataResponse(
      dates: json['dates'] == null
          ? null
          : BodyDatesResponse.fromJson(json['dates'] as Map<String, dynamic>),
      observer: json['observer'] == null
          ? null
          : BodyObserverResponse.fromJson(
              json['observer'] as Map<String, dynamic>),
      table: json['table'] == null
          ? null
          : BodyTableResponse.fromJson(json['table'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyDetailsDataResponseToJson(
        BodyDetailsDataResponse instance) =>
    <String, dynamic>{
      'dates': instance.dates,
      'observer': instance.observer,
      'table': instance.table,
    };

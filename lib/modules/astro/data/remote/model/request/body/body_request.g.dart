// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyRequest _$BodyRequestFromJson(Map<String, dynamic> json) => BodyRequest(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      fromDate: json['from_date'] as String,
      toDate: json['to_date'] as String,
      time: json['time'] as String,
      elevation: (json['elevation'] as num).toDouble(),
    );

Map<String, dynamic> _$BodyRequestToJson(BodyRequest instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'from_date': instance.fromDate,
      'to_date': instance.toDate,
      'time': instance.time,
      'elevation': instance.elevation,
    };

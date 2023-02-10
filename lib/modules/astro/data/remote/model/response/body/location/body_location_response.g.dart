// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyLocationResponse _$BodyLocationResponseFromJson(
        Map<String, dynamic> json) =>
    BodyLocationResponse(
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      elevation: json['elevation'] as int?,
    );

Map<String, dynamic> _$BodyLocationResponseToJson(
        BodyLocationResponse instance) =>
    <String, dynamic>{
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'elevation': instance.elevation,
    };

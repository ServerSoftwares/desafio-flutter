// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_distance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyDistanceResponse _$BodyDistanceResponseFromJson(
        Map<String, dynamic> json) =>
    BodyDistanceResponse(
      fromEarth: json['from_earth'] == null
          ? null
          : BodyDistanceFromEarthResponse.fromJson(
              json['from_earth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyDistanceResponseToJson(
        BodyDistanceResponse instance) =>
    <String, dynamic>{
      'from_earth': instance.fromEarth,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_distance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyDistanceResponse _$BodyDistanceResponseFromJson(
        Map<String, dynamic> json) =>
    BodyDistanceResponse(
      fromEarth: json['fromEarth'] == null
          ? null
          : BodyDistanceFromEarthResponse.fromJson(
              json['fromEarth'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyDistanceResponseToJson(
        BodyDistanceResponse instance) =>
    <String, dynamic>{
      'fromEarth': instance.fromEarth,
    };

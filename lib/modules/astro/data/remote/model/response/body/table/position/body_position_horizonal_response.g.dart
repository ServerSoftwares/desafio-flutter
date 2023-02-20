// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_position_horizonal_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyPositionHorizonalResponse _$BodyPositionHorizonalResponseFromJson(
        Map<String, dynamic> json) =>
    BodyPositionHorizonalResponse(
      altitude: json['altitude'] == null
          ? null
          : BodyAltitudeResponse.fromJson(
              json['altitude'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyPositionHorizonalResponseToJson(
        BodyPositionHorizonalResponse instance) =>
    <String, dynamic>{
      'altitude': instance.altitude,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_position_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyPositionResponse _$BodyPositionResponseFromJson(
        Map<String, dynamic> json) =>
    BodyPositionResponse(
      horizonal: json['horizonal'] == null
          ? null
          : BodyPositionHorizonalResponse.fromJson(
              json['horizonal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyPositionResponseToJson(
        BodyPositionResponse instance) =>
    <String, dynamic>{
      'horizonal': instance.horizonal,
    };

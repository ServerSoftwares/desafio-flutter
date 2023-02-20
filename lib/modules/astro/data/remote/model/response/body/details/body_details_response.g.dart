// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyDetailsResponse _$BodyDetailsResponseFromJson(Map<String, dynamic> json) =>
    BodyDetailsResponse(
      data: json['data'] == null
          ? null
          : BodyDetailsDataResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyDetailsResponseToJson(
        BodyDetailsResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

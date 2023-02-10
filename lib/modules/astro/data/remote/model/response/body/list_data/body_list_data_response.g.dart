// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_list_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyListDataResponse _$BodyListDataResponseFromJson(
        Map<String, dynamic> json) =>
    BodyListDataResponse(
      data: json['data'] == null
          ? null
          : BodyListResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyListDataResponseToJson(
        BodyListDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

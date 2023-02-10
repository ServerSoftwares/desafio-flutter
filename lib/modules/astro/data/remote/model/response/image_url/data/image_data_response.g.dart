// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageDataResponse _$ImageDataResponseFromJson(Map<String, dynamic> json) =>
    ImageDataResponse(
      data: json['data'] == null
          ? null
          : ImageResponse.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImageDataResponseToJson(ImageDataResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

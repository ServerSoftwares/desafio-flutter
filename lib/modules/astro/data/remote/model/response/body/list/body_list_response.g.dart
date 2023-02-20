// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyListResponse _$BodyListResponseFromJson(Map<String, dynamic> json) =>
    BodyListResponse(
      bodies:
          (json['bodies'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BodyListResponseToJson(BodyListResponse instance) =>
    <String, dynamic>{
      'bodies': instance.bodies,
    };

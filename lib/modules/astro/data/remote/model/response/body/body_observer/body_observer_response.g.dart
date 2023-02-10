// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'body_observer_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyObserverResponse _$BodyObserverResponseFromJson(
        Map<String, dynamic> json) =>
    BodyObserverResponse(
      location: json['location'] == null
          ? null
          : BodyLocationResponse.fromJson(
              json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BodyObserverResponseToJson(
        BodyObserverResponse instance) =>
    <String, dynamic>{
      'location': instance.location,
    };

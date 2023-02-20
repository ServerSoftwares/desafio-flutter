// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'observer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ObserverRequest _$ObserverRequestFromJson(Map<String, dynamic> json) =>
    ObserverRequest(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      date: json['date'] as String,
    );

Map<String, dynamic> _$ObserverRequestToJson(ObserverRequest instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'date': instance.date,
    };

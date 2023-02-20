// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moon_phase_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoonPhaseRequest _$MoonPhaseRequestFromJson(Map<String, dynamic> json) =>
    MoonPhaseRequest(
      format: json['format'] as String,
      style:
          MoonPhaseStyleRequest.fromJson(json['style'] as Map<String, dynamic>),
      observer:
          ObserverRequest.fromJson(json['observer'] as Map<String, dynamic>),
      view: MoonPhaseViewRequest.fromJson(json['view'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MoonPhaseRequestToJson(MoonPhaseRequest instance) =>
    <String, dynamic>{
      'format': instance.format,
      'style': instance.style,
      'observer': instance.observer,
      'view': instance.view,
    };

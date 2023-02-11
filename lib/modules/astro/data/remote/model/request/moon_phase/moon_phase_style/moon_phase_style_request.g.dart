// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moon_phase_style_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoonPhaseStyleRequest _$MoonPhaseStyleRequestFromJson(
        Map<String, dynamic> json) =>
    MoonPhaseStyleRequest(
      moonStyle: json['moonStyle'] as String,
      backgroundStyle: json['backgroundStyle'] as String,
      backgroundColor: json['backgroundColor'] as String,
      headingColor: json['headingColor'] as String,
      textColor: json['textColor'] as String,
    );

Map<String, dynamic> _$MoonPhaseStyleRequestToJson(
        MoonPhaseStyleRequest instance) =>
    <String, dynamic>{
      'moonStyle': instance.moonStyle,
      'backgroundStyle': instance.backgroundStyle,
      'backgroundColor': instance.backgroundColor,
      'headingColor': instance.headingColor,
      'textColor': instance.textColor,
    };

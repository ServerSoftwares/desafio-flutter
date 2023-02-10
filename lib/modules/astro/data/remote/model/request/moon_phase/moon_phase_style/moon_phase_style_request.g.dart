// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moon_phase_style_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoonPhaseStyleRequest _$MoonPhaseStyleRequestFromJson(
        Map<String, dynamic> json) =>
    MoonPhaseStyleRequest(
      moonStyle: json['moon_style'] as String,
      backgroundStyle: json['background_style'] as String,
      backgroundColor: json['background_color'] as String,
      headingColor: json['heading_color'] as String,
      textColor: json['text_color'] as String,
    );

Map<String, dynamic> _$MoonPhaseStyleRequestToJson(
        MoonPhaseStyleRequest instance) =>
    <String, dynamic>{
      'moon_style': instance.moonStyle,
      'background_style': instance.backgroundStyle,
      'background_color': instance.backgroundColor,
      'heading_color': instance.headingColor,
      'text_color': instance.textColor,
    };

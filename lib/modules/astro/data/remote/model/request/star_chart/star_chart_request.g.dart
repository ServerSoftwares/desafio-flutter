// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_chart_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarChartRequest _$StarChartRequestFromJson(Map<String, dynamic> json) =>
    StarChartRequest(
      style: json['style'] as String,
      observer:
          ObserverRequest.fromJson(json['observer'] as Map<String, dynamic>),
      view: StarChartViewRequest.fromJson(json['view'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StarChartRequestToJson(StarChartRequest instance) =>
    <String, dynamic>{
      'style': instance.style,
      'observer': instance.observer,
      'view': instance.view,
    };

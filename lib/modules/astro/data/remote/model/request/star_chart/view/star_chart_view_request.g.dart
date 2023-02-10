// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'star_chart_view_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StarChartViewRequest _$StarChartViewRequestFromJson(
        Map<String, dynamic> json) =>
    StarChartViewRequest(
      type: json['type'] as String,
      parameters: StarChartViewParametersRequest.fromJson(
          json['parameters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StarChartViewRequestToJson(
        StarChartViewRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'parameters': instance.parameters,
    };

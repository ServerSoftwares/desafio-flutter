import 'package:json_annotation/json_annotation.dart';

import '../parameters/star_chart_view_parameters_request.dart';

part 'star_chart_view_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StarChartViewRequest {
  StarChartViewRequest({
    required this.type,
    required this.parameters,
  });

  factory StarChartViewRequest.fromJson(Map<String, dynamic> json) =>
      _$StarChartViewRequestFromJson(json);

  final String type;
  final StarChartViewParametersRequest parameters;

  Map<String, dynamic> toJson() => _$StarChartViewRequestToJson(this);
}

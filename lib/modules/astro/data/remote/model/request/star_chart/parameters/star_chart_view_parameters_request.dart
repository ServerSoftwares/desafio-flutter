import 'package:json_annotation/json_annotation.dart';

part 'star_chart_view_parameters_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StarChartViewParametersRequest {
  StarChartViewParametersRequest({
    required this.constellation,
  });

  factory StarChartViewParametersRequest.fromJson(Map<String, dynamic> json) =>
      _$StarChartViewParametersRequestFromJson(json);

  final String constellation;

  Map<String, dynamic> toJson() => _$StarChartViewParametersRequestToJson(this);
}

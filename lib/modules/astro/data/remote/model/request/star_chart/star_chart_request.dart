import 'package:json_annotation/json_annotation.dart';

import '../observer/observer_request.dart';
import 'view/star_chart_view_request.dart';

part 'star_chart_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StarChartRequest {
  StarChartRequest({
    required this.style,
    required this.observer,
    required this.view,
  });

  factory StarChartRequest.fromJson(Map<String, dynamic> json) =>
      _$StarChartRequestFromJson(json);

  final String style;
  final ObserverRequest observer;
  final StarChartViewRequest view;

  Map<String, dynamic> toJson() => _$StarChartRequestToJson(this);
}

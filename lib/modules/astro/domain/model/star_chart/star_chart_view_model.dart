import 'star_chart_view_parameters_model.dart';

class StarChartViewModel {
  StarChartViewModel({
    required this.type,
    required this.parameters,
  });

  final String type;
  final StarChartViewParametersModel parameters;
}

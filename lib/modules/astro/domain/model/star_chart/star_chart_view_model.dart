import 'package:equatable/equatable.dart';

import 'star_chart_view_parameters_model.dart';

class StarChartViewModel extends Equatable {
  const StarChartViewModel({
    required this.type,
    required this.parameters,
  });

  final String type;
  final StarChartViewParametersModel parameters;

  @override
  List<Object?> get props => [
        type,
        parameters,
      ];
}

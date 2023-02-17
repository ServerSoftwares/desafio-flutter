import 'package:equatable/equatable.dart';

import '../observer/observer_model.dart';
import 'star_chart_view_model.dart';

class StarChartModel extends Equatable {
  const StarChartModel({
    required this.style,
    required this.observer,
    required this.view,
  });

  final String style;
  final ObserverModel observer;
  final StarChartViewModel view;

  @override
  List<Object?> get props => [
        style,
        observer,
        view,
      ];
}

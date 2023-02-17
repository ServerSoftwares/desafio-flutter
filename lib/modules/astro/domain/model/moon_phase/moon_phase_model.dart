import 'package:equatable/equatable.dart';

import '../observer/observer_model.dart';
import 'moon_phase_style_model.dart';
import 'moon_phase_view_model.dart';

class MoonPhaseModel extends Equatable{
  const MoonPhaseModel({
    required this.format,
    required this.style,
    required this.observer,
    required this.view,
  });

  final String format;
  final MoonPhaseStyleModel style;
  final ObserverModel observer;
  final MoonPhaseViewModel view;

  @override
  List<Object?> get props => [
    format,
    style,
    observer,
    view,
  ];
}

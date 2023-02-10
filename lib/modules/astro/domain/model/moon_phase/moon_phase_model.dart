import '../observer/observer_model.dart';
import 'moon_phase_style_model.dart';
import 'moon_phase_view_model.dart';

class MoonPhaseModel {
  MoonPhaseModel({
    required this.format,
    required this.style,
    required this.observer,
    required this.view,
  });

  final String format;
  final MoonPhaseStyleModel style;
  final ObserverModel observer;
  final MoonPhaseViewModel view;
}

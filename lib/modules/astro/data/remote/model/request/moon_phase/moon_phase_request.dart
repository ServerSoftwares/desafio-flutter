import 'package:json_annotation/json_annotation.dart';

import '../observer/observer_request.dart';
import 'moon_phase_style/moon_phase_style_request.dart';
import 'moon_phase_view/moon_phase_view_request.dart';

part 'moon_phase_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MoonPhaseRequest {
  MoonPhaseRequest({
    required this.format,
    required this.style,
    required this.observer,
    required this.view,
  });

  factory MoonPhaseRequest.fromJson(Map<String, dynamic> json) =>
      _$MoonPhaseRequestFromJson(json);

  final String format;
  final MoonPhaseStyleRequest style;
  final ObserverRequest observer;
  final MoonPhaseViewRequest view;

  Map<String, dynamic> toJson() => _$MoonPhaseRequestToJson(this);
}

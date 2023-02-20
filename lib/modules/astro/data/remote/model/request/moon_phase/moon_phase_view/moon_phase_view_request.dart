import 'package:json_annotation/json_annotation.dart';

part 'moon_phase_view_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class MoonPhaseViewRequest {
  MoonPhaseViewRequest({
    required this.type,
    required this.orientation,
  });

  factory MoonPhaseViewRequest.fromJson(Map<String, dynamic> json) =>
      _$MoonPhaseViewRequestFromJson(json);

  final String type;
  final String orientation;

  Map<String, dynamic> toJson() => _$MoonPhaseViewRequestToJson(this);
}

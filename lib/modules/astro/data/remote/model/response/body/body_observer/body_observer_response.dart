import 'package:json_annotation/json_annotation.dart';

import '../location/body_location_response.dart';

part 'body_observer_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BodyObserverResponse {
  BodyObserverResponse({
    this.location,
  });

  factory BodyObserverResponse.fromJson(Map<String, dynamic> json) =>
      _$BodyObserverResponseFromJson(json);

  final BodyLocationResponse? location;

  Map<String, dynamic> toJson() => _$BodyObserverResponseToJson(this);
}

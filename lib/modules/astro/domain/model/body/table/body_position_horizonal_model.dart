import 'package:equatable/equatable.dart';

import 'body_altitude_model.dart';

class BodyPositionHorizonalModel extends Equatable {
  const BodyPositionHorizonalModel({
    required this.altitude,
  });

  final BodyAltitudeModel altitude;

  @override
  List<Object?> get props => [altitude];
}

import 'body_altitude_model.dart';

class BodyPositionHorizonalModel {
  BodyPositionHorizonalModel({
    required this.altitude,
    required this.azimuth,
  });

  final BodyAltitudeModel altitude;
  final BodyAltitudeModel azimuth;
}

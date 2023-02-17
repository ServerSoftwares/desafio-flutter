import 'package:equatable/equatable.dart';

class BodyAltitudeModel extends Equatable {
  const BodyAltitudeModel({
    required this.degrees,
  });

  final String degrees;

  @override
  List<Object?> get props => [degrees];
}

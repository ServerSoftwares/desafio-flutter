import 'package:equatable/equatable.dart';

class BodyDistanceFromEarthModel extends Equatable {
  const BodyDistanceFromEarthModel({
    required this.km,
  });

  final String km;

  @override
  List<Object?> get props => [km];
}

import 'package:equatable/equatable.dart';

import 'body_distance_from_earth_model.dart';

class BodyDistanceModel extends Equatable {
  const BodyDistanceModel({
    required this.fromEarth,
  });

  final BodyDistanceFromEarthModel fromEarth;

  @override
  List<Object?> get props => [fromEarth];
}

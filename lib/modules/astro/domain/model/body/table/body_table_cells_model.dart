import 'package:equatable/equatable.dart';

import 'body_distance_model.dart';
import 'body_position_model.dart';

class BodyTableCellsModel extends Equatable {
  const BodyTableCellsModel({
    required this.date,
    required this.distance,
    required this.position,
  });

  final String date;
  final BodyDistanceModel distance;
  final BodyPositionModel position;

  @override
  List<Object?> get props => [
        date,
        distance,
        position,
      ];
}

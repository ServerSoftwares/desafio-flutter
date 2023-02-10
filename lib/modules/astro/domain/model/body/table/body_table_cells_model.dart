import 'body_distance_model.dart';
import 'body_position_model.dart';

class BodyTableCellsModel {
  BodyTableCellsModel({
    required this.date,
    required this.id,
    required this.name,
    required this.distance,
    required this.position,
  });

  final String date;
  final String id;
  final String name;
  final BodyDistanceModel distance;
  final BodyPositionModel position;
}

import 'package:equatable/equatable.dart';

import 'body_position_horizonal_model.dart';

class BodyPositionModel extends Equatable {
  const BodyPositionModel({
    required this.horizonal,
  });

  final BodyPositionHorizonalModel horizonal;

  @override
  List<Object?> get props => [horizonal];
}

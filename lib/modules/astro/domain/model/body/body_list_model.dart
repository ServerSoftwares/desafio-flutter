import 'package:equatable/equatable.dart';

class BodyListModel extends Equatable {
  const BodyListModel({
    required this.bodies,
  });

  final List<String> bodies;

  @override
  List<Object?> get props => [bodies];
}

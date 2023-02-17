import 'package:equatable/equatable.dart';

class MoonPhaseViewModel extends Equatable {
  const MoonPhaseViewModel({
    required this.type,
    required this.orientation,
  });

  final String type;
  final String orientation;

  @override
  List<Object?> get props => [
        type,
        orientation,
      ];
}

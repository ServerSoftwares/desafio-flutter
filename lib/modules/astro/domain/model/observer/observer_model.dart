import 'package:equatable/equatable.dart';

class ObserverModel extends Equatable {
  const ObserverModel({
    required this.latitude,
    required this.longitude,
    required this.date,
  });

  final double latitude;
  final double longitude;
  final String date;

  @override
  List<Object?> get props => [
        latitude,
        longitude,
        date,
      ];
}

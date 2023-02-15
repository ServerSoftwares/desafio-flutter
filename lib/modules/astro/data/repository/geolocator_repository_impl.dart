import 'package:geolocator/geolocator.dart';

import '../../domain/repository/geolocator_repository.dart';

class GeolocatorRepositoryImpl implements GeolocatorRepository {
  @override
  Future<Position> getPosition() async => Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
}

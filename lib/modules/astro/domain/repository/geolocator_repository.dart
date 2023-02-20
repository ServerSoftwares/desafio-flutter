import 'package:geolocator/geolocator.dart';

mixin GeolocatorRepository {
  Future<Position> getPosition();
}

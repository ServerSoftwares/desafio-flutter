import 'package:geolocator/geolocator.dart';

import '../repository/geolocator_repository.dart';

mixin GetPositionUseCase {
  Future<Position> call();
}

class GetPositionUseCaseImpl implements GetPositionUseCase {
  GetPositionUseCaseImpl({
    required GeolocatorRepository geolocatorRepository,
  }) : _geolocatorRepository = geolocatorRepository;

  final GeolocatorRepository _geolocatorRepository;

  @override
  Future<Position> call() async => _geolocatorRepository.getPosition();
}

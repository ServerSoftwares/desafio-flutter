import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observador_app/modules/astro/domain/repository/geolocator_repository.dart';
import 'package:observador_app/modules/astro/domain/use_case/get_position_use_case.dart';

import 'get_position_use_case_impl_test.mocks.dart';

@GenerateMocks([GeolocatorRepository])
void main() {
  late MockGeolocatorRepository mockGeolocatorRepository;
  late GetPositionUseCase getPositionUseCase;

  setUpAll(() {
    mockGeolocatorRepository = MockGeolocatorRepository();
    getPositionUseCase =
        GetPositionUseCaseImpl(geolocatorRepository: mockGeolocatorRepository);
  });

  setUp(() => reset(mockGeolocatorRepository));

  test(
      'GIVEN a call on call'
      'THEN it should return a Position', () async {
    when(mockGeolocatorRepository.getPosition())
        .thenAnswer((_) async => _getPositionMock());
    final position = await getPositionUseCase.call();
    final positionExpected = _getPositionMock();
    expect(position, positionExpected);
    verify(mockGeolocatorRepository.getPosition()).called(1);
  });
}

Position _getPositionMock() => Position(
      longitude: 0,
      latitude: 0,
      timestamp: DateTime.now(),
      accuracy: 5,
      altitude: 0,
      heading: 0,
      speed: 0,
      speedAccuracy: 0.5,
    );

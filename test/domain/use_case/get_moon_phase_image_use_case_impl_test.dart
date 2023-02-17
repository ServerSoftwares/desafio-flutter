import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observador_app/modules/astro/domain/model/image_url/image_data_model.dart';
import 'package:observador_app/modules/astro/domain/model/image_url/image_model.dart';
import 'package:observador_app/modules/astro/domain/model/moon_phase/moon_phase_model.dart';
import 'package:observador_app/modules/astro/domain/model/moon_phase/moon_phase_style_model.dart';
import 'package:observador_app/modules/astro/domain/model/moon_phase/moon_phase_view_model.dart';
import 'package:observador_app/modules/astro/domain/model/observer/observer_model.dart';
import 'package:observador_app/modules/astro/domain/repository/astro_repository.dart';
import 'package:observador_app/modules/astro/domain/use_case/get_moon_phase_image_use_case.dart';

import 'get_moon_phase_image_use_case_impl_test.mocks.dart';

@GenerateMocks([AstroRepository])
void main() {
  late GetMoonPhaseImageUseCase getMoonPhaseImageUseCase;
  late MockAstroRepository mockAstroRepository;

  setUpAll(() {
    mockAstroRepository = MockAstroRepository();
    getMoonPhaseImageUseCase =
        GetMoonPhaseImageUseCaseImpl(astroRepository: mockAstroRepository);
  });

  setUp(() => reset(mockAstroRepository));

  group('GIVEN a call on call', () {
    test(
        'WHEN request is successful'
        'THEN it should return an ImageDataModel', () async {
      when(mockAstroRepository.getMoonPhaseImage(any))
          .thenAnswer((_) async => _getSuccessfulMoonPhaseImageDataModelMock());
      final imageDataModel =
          await getMoonPhaseImageUseCase.call(_getDefaultMoonPhaseModel());
      final imageDataModelExpected =
          _getSuccessfulMoonPhaseImageDataModelMock();
      expect(imageDataModel, imageDataModelExpected);
      verify(mockAstroRepository.getMoonPhaseImage(_getDefaultMoonPhaseModel()))
          .called(1);
    });
  });
}

ImageDataModel _getSuccessfulMoonPhaseImageDataModelMock() =>
    const ImageDataModel(
      data: ImageModel(
        imageUrl:
            'https://widgets.astronomyapi.com/moon-phase/generated/c33f32c0a69f7e74f539afa6e9bc9cf821752cc5516ed131f432f61a1fb57c13.png',
      ),
    );

MoonPhaseModel _getDefaultMoonPhaseModel() => const MoonPhaseModel(
      format: 'png',
      style: MoonPhaseStyleModel(
        moonStyle: 'sketch',
        backgroundStyle: 'stars',
        backgroundColor: 'red',
        headingColor: 'white',
        textColor: 'red',
      ),
      observer: ObserverModel(
        latitude: -84.39733,
        longitude: 33.775867,
        date: '2023-02-15',
      ),
      view: MoonPhaseViewModel(
        type: 'portrait-simple',
        orientation: 'south-up',
      ),
    );

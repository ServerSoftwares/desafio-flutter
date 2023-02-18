import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observador_app/modules/astro/domain/model/image_url/image_data_model.dart';
import 'package:observador_app/modules/astro/domain/model/image_url/image_model.dart';
import 'package:observador_app/modules/astro/domain/model/observer/observer_model.dart';
import 'package:observador_app/modules/astro/domain/model/star_chart/star_chart_model.dart';
import 'package:observador_app/modules/astro/domain/model/star_chart/star_chart_view_model.dart';
import 'package:observador_app/modules/astro/domain/model/star_chart/star_chart_view_parameters_model.dart';
import 'package:observador_app/modules/astro/domain/repository/astro_repository.dart';
import 'package:observador_app/modules/astro/domain/use_case/get_star_chart_image_use_case.dart';
import 'package:observador_app/modules/astro/presentation/controller/star_chart_page_controller.dart';

import 'get_star_chart_image_use_case_impl_test.mocks.dart';

@GenerateMocks([AstroRepository])
void main() {
  late MockAstroRepository mockAstroRepository;
  late GetStarChartImageUseCase getStarChartImageUseCase;

  setUpAll(() {
    mockAstroRepository = MockAstroRepository();
    getStarChartImageUseCase =
        GetStarChartImageUseCaseImpl(astroRepository: mockAstroRepository);
  });

  setUp(() => reset(mockAstroRepository));

  group('GIVEN a call on call', () {
    test(
        'WHEN request is successful '
        'THEN it should return an ImageDataModel', () async {
      when(mockAstroRepository.getStarChartImage(any))
          .thenAnswer((realInvocation) async => _getImageDataModelMock());
      final imageDataModel =
          await getStarChartImageUseCase.call(_getDefaultStarChartModel());
      final imageDataModelExpected = _getImageDataModelMock();
      expect(imageDataModel, imageDataModelExpected);
      verify(mockAstroRepository.getStarChartImage(any)).called(1);
    });
    test(
        'WHEN request fails'
        'THEN it should return an Exception', () async {
      when(mockAstroRepository.getStarChartImage(any)).thenThrow(Exception());
      expect(() => getStarChartImageUseCase.call(_getDefaultStarChartModel()),
          throwsException);
    });
  });
}

ImageDataModel _getImageDataModelMock() => const ImageDataModel(
      data: ImageModel(
        imageUrl:
            'https://widgets.astronomyapi.com/star-chart/generated/98ba882ff2ba3827559994f2525c0e3a3bbee85b3a0708f4e512b37ddb8b7379.png',
      ),
    );

StarChartModel _getDefaultStarChartModel() => const StarChartModel(
      style: 'inverted',
      observer: ObserverModel(
        latitude: 0,
        longitude: 0,
        date: '2023-02-15',
      ),
      view: StarChartViewModel(
        type: StarChartDefaultParameters.type,
        parameters: StarChartViewParametersModel(
          constellation: 'ori',
        ),
      ),
    );

import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observador_app/modules/astro/data/cache/astro_cache_data_source.dart';
import 'package:observador_app/modules/astro/data/remote/data_source/astro_remote_data_source.dart';
import 'package:observador_app/modules/astro/data/repository/astro_repository_impl.dart';
import 'package:observador_app/modules/astro/domain/model/body/body_details_data_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/body_details_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/body_list_data_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/body_list_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/body_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_altitude_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_distance_from_earth_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_distance_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_position_horizonal_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_position_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_table_cells_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_table_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_table_rows_model.dart';
import 'package:observador_app/modules/astro/domain/model/image_url/image_data_model.dart';
import 'package:observador_app/modules/astro/domain/model/image_url/image_model.dart';
import 'package:observador_app/modules/astro/domain/model/moon_phase/moon_phase_model.dart';
import 'package:observador_app/modules/astro/domain/model/moon_phase/moon_phase_style_model.dart';
import 'package:observador_app/modules/astro/domain/model/moon_phase/moon_phase_view_model.dart';
import 'package:observador_app/modules/astro/domain/model/observer/observer_model.dart';
import 'package:observador_app/modules/astro/domain/model/star_chart/star_chart_model.dart';
import 'package:observador_app/modules/astro/domain/model/star_chart/star_chart_view_model.dart';
import 'package:observador_app/modules/astro/domain/model/star_chart/star_chart_view_parameters_model.dart';
import 'package:observador_app/modules/astro/presentation/controller/star_chart_page_controller.dart';
import 'package:observador_app/modules/astro/utils/date_time_extensions.dart';

import 'astro_repository_repository_impl_test.mocks.dart';

@GenerateMocks([AstroRemoteDataSource, AstroCacheDataSource])
void main() {
  late MockAstroRemoteDataSource mockAstroRemoteDataSource;
  late MockAstroCacheDataSource mockAstroCacheDataSource;
  late AstroRepositoryImpl astroRepositoryImpl;

  setUpAll(() {
    mockAstroRemoteDataSource = MockAstroRemoteDataSource();
    mockAstroCacheDataSource = MockAstroCacheDataSource();
    astroRepositoryImpl = AstroRepositoryImpl(
      astroRemoteDataSource: mockAstroRemoteDataSource,
      astroCacheDataSource: mockAstroCacheDataSource,
    );
  });

  setUp(() => reset(mockAstroRemoteDataSource));

  group('GIVEN a call on getMoonPhaseImage', () {
    test(
        'WHEN request is successful'
        'THEN it should return a ImageDataModel', () async {
      when(mockAstroRemoteDataSource.getMoonPhaseImage(any))
          .thenAnswer((_) async => _getSuccessfulMoonPhaseImageDataModelMock());
      final imageDataModel = await astroRepositoryImpl
          .getMoonPhaseImage(_getDefaultMoonPhaseModel());
      final imageDataModelExpected =
          _getSuccessfulMoonPhaseImageDataModelMock();
      expect(imageDataModel, imageDataModelExpected);
      verify(mockAstroRemoteDataSource
              .getMoonPhaseImage(_getDefaultMoonPhaseModel()))
          .called(1);
    });
    test(
        'WHEN request fails'
        'THEN it should return an Exception', () async {
      when(mockAstroRemoteDataSource.getMoonPhaseImage(any))
          .thenThrow(Exception());
      expect(
          () => astroRepositoryImpl
              .getMoonPhaseImage(_getDefaultMoonPhaseModel()),
          throwsException);
    });
  });
  group('GIVEN a call on getBodyList', () {
    test(
        'WHEN request is successful'
        'THEN it should return a BodyListDataModel', () async {
      when(mockAstroRemoteDataSource.getBodyList()).thenAnswer(
          (realInvocation) async => _getSuccessfulBodyListDataModelMock());
      final bodyListDataModel = await astroRepositoryImpl.getBodyList();
      final bodyListDataModelExpected = _getSuccessfulBodyListDataModelMock();
      expect(bodyListDataModel, bodyListDataModelExpected);
    });
    test(
        'WHEN request fails'
        'THEN it should return an Exception', () async {
      when(mockAstroRemoteDataSource.getBodyList()).thenThrow(Exception());
      expect(() => astroRepositoryImpl.getBodyList(), throwsException);
    });
  });
  group('GIVEN a call on getBodyDetailsModel', () {
    test(
        'WHEN request is successful'
        'THEN it should return a BodyDetailsModel', () async {
      when(mockAstroRemoteDataSource.getBodyDetailsModel(any, any))
          .thenAnswer((_) async => _getSuccessfulBodyDetailsModelMock());
      final bodyDetailsModel = await astroRepositoryImpl.getBodyDetailsModel(
          _getDefaultBodyModel(), 'sun');
      final bodyDetailsModelExpected = _getSuccessfulBodyDetailsModelMock();
      expect(bodyDetailsModel, bodyDetailsModelExpected);
    });
    test(
        'WHEN request fails'
        'THEN it should return an Exception', () async {
      when(mockAstroRemoteDataSource.getBodyDetailsModel(any, any))
          .thenThrow(Exception());
      expect(
          () => astroRepositoryImpl.getBodyDetailsModel(
              _getDefaultBodyModel(), 'sun'),
          throwsException);
    });
  });
  group('GIVEN a call on GetStarChartImage', () {
    test(
        'WHEN request is successful'
        'THEN it should return a ImageDataModel', () async {
      when(mockAstroRemoteDataSource.getStarChartImage(any))
          .thenAnswer((_) async => _getSuccessfulMoonPhaseImageDataModelMock());
      final imageDataModel = await mockAstroRemoteDataSource
          .getStarChartImage(_getDefaultStarChartModel());
      final imageDataModelExpected =
          _getSuccessfulMoonPhaseImageDataModelMock();
      expect(imageDataModel, imageDataModelExpected);
    });
    test(
        'WHEN request fails'
        'THEN it should return an Exception', () async {
      when(mockAstroRemoteDataSource.getStarChartImage(any))
          .thenThrow(Exception());
      expect(
          () => mockAstroRemoteDataSource
              .getStarChartImage(_getDefaultStarChartModel()),
          throwsException);
    });
  });
}

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

ImageDataModel _getSuccessfulMoonPhaseImageDataModelMock() =>
    const ImageDataModel(
      data: ImageModel(
        imageUrl:
            'https://widgets.astronomyapi.com/moon-phase/generated/c33f32c0a69f7e74f539afa6e9bc9cf821752cc5516ed131f432f61a1fb57c13.png',
      ),
    );

BodyListDataModel _getSuccessfulBodyListDataModelMock() =>
    const BodyListDataModel(
      data: BodyListModel(
        bodies: [
          'sun',
          'moon',
          'mercury',
          'venus',
          'earth',
          'mars',
          'jupiter',
          'saturn',
          'uranus',
          'neptune',
          'pluto',
        ],
      ),
    );

BodyDetailsModel _getSuccessfulBodyDetailsModelMock() => const BodyDetailsModel(
      data: BodyDetailsDataModel(
        table: BodyTableModel(
          rows: [
            BodyTableRowsModel(
              cells: [
                BodyTableCellsModel(
                  date: '2023-02-15',
                  distance: BodyDistanceModel(
                    fromEarth: BodyDistanceFromEarthModel(km: '0'),
                  ),
                  position: BodyPositionModel(
                    horizonal: BodyPositionHorizonalModel(
                      altitude: BodyAltitudeModel(degrees: '0'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

BodyModel _getDefaultBodyModel() => BodyModel(
      latitude: 0,
      longitude: 0,
      fromDate: DateTime.now().formatDate(true),
      toDate: DateTime.now().formatDate(true),
      time: DateFormat.Hms().format(DateTime.now()),
      elevation: 0,
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

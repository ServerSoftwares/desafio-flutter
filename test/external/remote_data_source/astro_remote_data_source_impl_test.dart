import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observador_app/modules/astro/constants/constants_url_api.dart';
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
import 'package:observador_app/modules/astro/external/remote_data_source/astro_remote_data_source_impl.dart';
import 'package:observador_app/modules/astro/presentation/controller/star_chart_page_controller.dart';
import 'package:observador_app/modules/astro/utils/date_time_extensions.dart';

import '../../utils/json_extensions.dart';
import 'astro_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late AstroRemoteDataSourceImpl astroRemoteDataSourceImpl;

  final encodedHash = base64Encode(utf8.encode(ConstantsUrlApi.hash));

  setUpAll(() {
    mockDio = MockDio();
    astroRemoteDataSourceImpl = AstroRemoteDataSourceImpl(dio: mockDio);
  });

  setUp(() => reset(mockDio));

  group('GIVEN a call on getMoonPhaseImage', () {
    const getMoonPhaseImageSuccessfulResponsePath =
        'test_resources/get_moon_phase_image_successful_result.json';
    test('THEN verify if correct URL is called', () async {
      final json =
          await getMoonPhaseImageSuccessfulResponsePath.getJsonFromPath();
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.post(
        any,
        options: anyNamed('options'),
        data: anyNamed('data'),
      )).thenAnswer((_) async => _getSuccessfulResponseMock(json));
      await astroRemoteDataSourceImpl
          .getMoonPhaseImage(_getDefaultMoonPhaseModel());
      verify(mockDio.post(
        any,
        options: anyNamed('options'),
        data: anyNamed('data'),
      )).called(1);
    });
    test(
        'WHEN request is successful'
        'THEN it should return a ImageDataModel', () async {
      final json =
          await getMoonPhaseImageSuccessfulResponsePath.getJsonFromPath();
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.post(
        any,
        options: anyNamed('options'),
        data: anyNamed('data'),
      )).thenAnswer((_) async => _getSuccessfulResponseMock(json));
      final imageDataModel = await astroRemoteDataSourceImpl
          .getMoonPhaseImage(_getDefaultMoonPhaseModel());
      final imageDataModelExpected =
          _getSuccessfulMoonPhaseImageDataModelMock();
      expect(imageDataModel, imageDataModelExpected);
    });
    test(
        'WHEN request fails'
        'THEN it should return an Exception', () async {
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.post(
        any,
        options: anyNamed('options'),
        data: anyNamed('data'),
      )).thenThrow(Exception());
      expect(
          () => astroRemoteDataSourceImpl
              .getMoonPhaseImage(_getDefaultMoonPhaseModel()),
          throwsException);
    });
  });
  group('GIVEN a call on getBodyList', () {
    const getBodyListSuccessfulResponsePath =
        'test_resources/get_body_list_successful_result.json';
    test('THEN verify if correct URL is called', () async {
      final json = await getBodyListSuccessfulResponsePath.getJsonFromPath();
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.get(
        any,
        options: anyNamed('options'),
      )).thenAnswer((_) async => _getSuccessfulResponseMock(json));
      await astroRemoteDataSourceImpl.getBodyList();
      verify(mockDio.get(any)).called(1);
    });
    test(
        'WHEN request is successful '
        'THEN it should return a BodyListDataModel', () async {
      final json = await getBodyListSuccessfulResponsePath.getJsonFromPath();
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.get(
        any,
        options: anyNamed('options'),
      )).thenAnswer((_) async => _getSuccessfulResponseMock(json));
      final bodyListDataModel = await astroRemoteDataSourceImpl.getBodyList();
      final bodyListDataModelExpected = _getSuccessfulBodyListDataModelMock();
      expect(bodyListDataModel, bodyListDataModelExpected);
    });
    test(
        'WHEN request fails'
        'THEN it should return an Exception', () async {
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.get(
        any,
        options: anyNamed('options'),
      )).thenThrow(Exception());
      expect(() => astroRemoteDataSourceImpl.getBodyList(), throwsException);
    });
  });

  group('GIVEN a call on getBodyDetailsModel', () {
    const getBodyDetailsModelSuccessfulResponsePath =
        'test_resources/get_body_details_model_successful_result.json';
    test('THEN verify if correct URL is called', () async {
      final json =
          await getBodyDetailsModelSuccessfulResponsePath.getJsonFromPath();
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.get(
        any,
        options: anyNamed('options'),
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => _getSuccessfulResponseMock(json));
      await astroRemoteDataSourceImpl.getBodyDetailsModel(
          _getDefaultBodyModel(), 'sun');
      verify(mockDio.get(
        any,
        options: anyNamed('options'),
        queryParameters: anyNamed('queryParameters'),
      )).called(1);
    });
    test(
        'WHEN request is successful'
        'THEN it should return a BodyDetailsModel', () async {
      final json =
          await getBodyDetailsModelSuccessfulResponsePath.getJsonFromPath();
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.get(
        any,
        options: anyNamed('options'),
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer((_) async => _getSuccessfulResponseMock(json));
      final bodyDetailsModel = await astroRemoteDataSourceImpl
          .getBodyDetailsModel(_getDefaultBodyModel(), 'sun');

      final bodyDetailsModelExpected = _getSuccessfulBodyDetailsModelMock();
      expect(bodyDetailsModel, bodyDetailsModelExpected);
    });
    test(
        'WHEN request fails'
        'THEN it should return an Exception', () async {
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.get(
        any,
        options: anyNamed('options'),
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(Exception());
      expect(
          () => astroRemoteDataSourceImpl.getBodyDetailsModel(
              _getDefaultBodyModel(), 'sun'),
          throwsException);
    });
  });
  group('GIVEN a call on getStarChartImage', () {
    const getStarChartImageSuccessfulResponsePath =
        'test_resources/get_star_chart_image_successful_result.json';
    test('THEN verify if correct URL is called', () async {
      final json =
          await getStarChartImageSuccessfulResponsePath.getJsonFromPath();
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.post(
        any,
        options: anyNamed('options'),
        data: anyNamed('data'),
      )).thenAnswer((_) async => _getSuccessfulResponseMock(json));
      await astroRemoteDataSourceImpl
          .getStarChartImage(_getDefaultStarChartModel());
      verify(mockDio.post(
        any,
        options: anyNamed('options'),
        data: anyNamed('data'),
      )).called(1);
    });
    test(
        'WHEN request is successful'
        'THEN it should return a ImageDataModel', () async {
      final json =
          await getStarChartImageSuccessfulResponsePath.getJsonFromPath();
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.post(
        any,
        options: anyNamed('options'),
        data: anyNamed('data'),
      )).thenAnswer((_) async => _getSuccessfulResponseMock(json));
      final imageDataModel = await astroRemoteDataSourceImpl
          .getStarChartImage(_getDefaultStarChartModel());
      final imageDataModelExpected =
          _getSuccessfulStarChartImageDataModelMock();
      expect(imageDataModel, imageDataModelExpected);
    });
    test(
        'WHEN request fails'
        'THEN it should return an Exception', () async {
      when(mockDio.options).thenAnswer((_) => BaseOptions(
            headers: {'authorization': 'Basic $encodedHash'},
          ));
      when(mockDio.post(
        any,
        options: anyNamed('options'),
        data: anyNamed('data'),
      )).thenThrow(Exception());
      expect(
          () => astroRemoteDataSourceImpl
              .getStarChartImage(_getDefaultStarChartModel()),
          throwsException);
    });
  });
}

Response<dynamic> _getSuccessfulResponseMock(json) => Response(
      data: json,
      statusCode: 200,
      requestOptions: RequestOptions(path: ''),
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

BodyModel _getDefaultBodyModel() => BodyModel(
      latitude: 0,
      longitude: 0,
      fromDate: DateTime.now().formatDate(true),
      toDate: DateTime.now().formatDate(true),
      time: DateFormat.Hms().format(DateTime.now()),
      elevation: 0,
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

ImageDataModel _getSuccessfulStarChartImageDataModelMock() =>
    const ImageDataModel(
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

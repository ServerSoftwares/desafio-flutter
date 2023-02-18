import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observador_app/modules/astro/domain/model/body/body_details_data_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/body_details_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/body_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_altitude_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_distance_from_earth_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_distance_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_position_horizonal_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_position_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_table_cells_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_table_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/table/body_table_rows_model.dart';
import 'package:observador_app/modules/astro/domain/repository/astro_repository.dart';
import 'package:observador_app/modules/astro/domain/use_case/get_body_list_details_model_use_case.dart';
import 'package:observador_app/modules/astro/utils/date_time_extensions.dart';

import 'get_body_list_details_model_use_case_impl_test.mocks.dart';

@GenerateMocks([AstroRepository])
void main() {
  late MockAstroRepository mockAstroRepository;
  late GetBodyDetailsModelUseCase getBodyDetailsModelUseCase;

  setUpAll(() {
    mockAstroRepository = MockAstroRepository();
    getBodyDetailsModelUseCase =
        GetBodyDetailsModelUseCaseImpl(astroRepository: mockAstroRepository);
  });

  setUp(() => reset(mockAstroRepository));

  group('GIVEN a call on call', () {
    test(
        'WHEN request is successful '
        'THEN it should return a BodyDetailsModel', () async {
      when(mockAstroRepository.getBodyDetailsModel(any, any))
          .thenAnswer((_) async => _getBodyDetailsModelMock());
      final bodyDetailsModel = await getBodyDetailsModelUseCase.call(
          _getDefaultBodyModel(), 'sun');
      final bodyDetailsModelExpected = _getBodyDetailsModelMock();
      expect(bodyDetailsModel, bodyDetailsModelExpected);
      verify(mockAstroRepository.getBodyDetailsModel(any, any)).called(1);
    });
    test(
        'WHEN request fails'
            'THEN it should return an Exception', () async {
      when(mockAstroRepository.getBodyDetailsModel(any, any))
          .thenThrow(Exception());
      expect(() => mockAstroRepository.getBodyDetailsModel(
          _getDefaultBodyModel(), 'sun'), throwsException);
    });
  });
}

BodyDetailsModel _getBodyDetailsModelMock() => const BodyDetailsModel(
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

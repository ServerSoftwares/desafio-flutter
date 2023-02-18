import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:observador_app/modules/astro/domain/model/body/body_list_data_model.dart';
import 'package:observador_app/modules/astro/domain/model/body/body_list_model.dart';
import 'package:observador_app/modules/astro/domain/repository/astro_repository.dart';
import 'package:observador_app/modules/astro/domain/use_case/get_body_list_use_case.dart';

import 'get_body_list_use_case_impl_test.mocks.dart';

@GenerateMocks([AstroRepository])
void main() {
  late GetBodyListUseCase getBodyListUseCase;
  late MockAstroRepository mockAstroRepository;

  setUpAll(() {
    mockAstroRepository = MockAstroRepository();
    getBodyListUseCase =
        GetBodyListUseCaseImpl(astroRepository: mockAstroRepository);
  });

  setUp(() => reset(mockAstroRepository));

  group('GIVEN a call on call', () {
    test(
        'WHEN request is successful '
        'THEN it should return a BodyListDataModel', () async {
      when(mockAstroRepository.getBodyList())
          .thenAnswer((_) async => _getSuccessfulBodyListDataModelMock());
      final bodyListDataModel = await getBodyListUseCase.call();
      final bodyListDataModelExpected = _getSuccessfulBodyListDataModelMock();
      expect(bodyListDataModel, bodyListDataModelExpected);
      verify(mockAstroRepository.getBodyList()).called(1);
    });
    test(
        'WHEN request fails'
            'THEN it should return an Exception', () async {
      when(mockAstroRepository.getBodyList())
          .thenThrow(Exception());
      expect(() => getBodyListUseCase.call(), throwsException);
    });
  });
}

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

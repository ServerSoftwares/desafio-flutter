import '../model/body/body_details_data_model.dart';
import '../model/body/body_model.dart';
import '../repository/astro_repository.dart';

mixin GetBodyListDetailsDataModelUseCase {
  Future<BodyDetailsDataModel> getBodyDetailsDataModel(
    BodyModel bodyModel,
    String bodyId,
  );
}

class GetBodyListDetailsDataModelUseCaseImpl
    implements GetBodyListDetailsDataModelUseCase {
  GetBodyListDetailsDataModelUseCaseImpl({
    required AstroRepository astroRepository,
  }) : _astroRepository = astroRepository;

  final AstroRepository _astroRepository;

  @override
  Future<BodyDetailsDataModel> getBodyDetailsDataModel(
          BodyModel bodyModel, String bodyId) =>
      _astroRepository.getBodyDetailsDataModel(bodyModel, bodyId);
}

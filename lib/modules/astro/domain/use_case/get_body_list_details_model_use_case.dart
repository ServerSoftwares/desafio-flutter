import '../model/body/body_details_model.dart';
import '../model/body/body_model.dart';
import '../repository/astro_repository.dart';

mixin GetBodyDetailsModelUseCase {
  Future<BodyDetailsModel> call(
    BodyModel bodyModel,
    String bodyId,
  );
}

class GetBodyDetailsModelUseCaseImpl implements GetBodyDetailsModelUseCase {
  GetBodyDetailsModelUseCaseImpl({
    required AstroRepository astroRepository,
  }) : _astroRepository = astroRepository;

  final AstroRepository _astroRepository;

  @override
  Future<BodyDetailsModel> call(
          BodyModel bodyModel, String bodyId) =>
      _astroRepository.getBodyDetailsModel(bodyModel, bodyId);
}

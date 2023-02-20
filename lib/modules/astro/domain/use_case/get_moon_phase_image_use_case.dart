import '../model/image_url/image_data_model.dart';
import '../model/moon_phase/moon_phase_model.dart';
import '../repository/astro_repository.dart';

mixin GetMoonPhaseImageUseCase {
  Future<ImageDataModel> call(MoonPhaseModel moonPhaseModel);
}

class GetMoonPhaseImageUseCaseImpl implements GetMoonPhaseImageUseCase {
  GetMoonPhaseImageUseCaseImpl({
    required AstroRepository astroRepository,
  }) : _astroRepository = astroRepository;

  final AstroRepository _astroRepository;

  @override
  Future<ImageDataModel> call(MoonPhaseModel moonPhaseModel) =>
      _astroRepository.getMoonPhaseImage(moonPhaseModel);
}

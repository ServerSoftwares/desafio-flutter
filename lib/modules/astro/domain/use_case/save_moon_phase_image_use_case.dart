import '../model/image_url/image_data_model.dart';
import '../repository/astro_repository.dart';

mixin SaveMoonPhaseImageUseCase {
  Future<void> call(ImageDataModel imageDataModel, String id);
}

class SaveMoonPhaseImageUseCaseImpl implements SaveMoonPhaseImageUseCase {
  SaveMoonPhaseImageUseCaseImpl({
    required AstroRepository astroRepository,
  }) : _astroRepository = astroRepository;

  final AstroRepository _astroRepository;

  @override
  Future<void> call(
          ImageDataModel imageDataModel, String id) async =>
      _astroRepository.saveMoonPhaseImage(imageDataModel, id);
}

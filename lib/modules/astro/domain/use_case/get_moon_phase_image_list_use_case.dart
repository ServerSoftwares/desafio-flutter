import '../model/image_url/image_data_model.dart';
import '../repository/astro_repository.dart';

mixin GetMoonPhaseImageList {
  Future<List<ImageDataModel>> call();
}

class GetMoonPhaseImageListImpl implements GetMoonPhaseImageList {
  GetMoonPhaseImageListImpl({
    required AstroRepository astroRepository,
  }) : _astroRepository = astroRepository;

  final AstroRepository _astroRepository;

  @override
  Future<List<ImageDataModel>> call() async =>
      _astroRepository.getMoonPhaseImageList();
}

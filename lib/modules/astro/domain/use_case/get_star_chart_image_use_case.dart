import '../model/image_url/image_data_model.dart';
import '../model/star_chart/star_chart_model.dart';
import '../repository/astro_repository.dart';

mixin GetStarChartImageUseCase {
  Future<ImageDataModel> call(StarChartModel starChartModel);
}

class GetStarChartImageUseCaseImpl implements GetStarChartImageUseCase {
  GetStarChartImageUseCaseImpl({
    required AstroRepository astroRepository,
  }) : _astroRepository = astroRepository;

  final AstroRepository _astroRepository;

  @override
  Future<ImageDataModel> call(StarChartModel starChartModel) =>
      _astroRepository.getStarChartImage(starChartModel);
}

import '../../domain/model/body/body_details_model.dart';
import '../../domain/model/body/body_list_data_model.dart';
import '../../domain/model/body/body_model.dart';
import '../../domain/model/image_url/image_data_model.dart';
import '../../domain/model/moon_phase/moon_phase_model.dart';
import '../../domain/model/star_chart/star_chart_model.dart';
import '../../domain/repository/astro_repository.dart';
import '../cache/astro_cache_data_source.dart';
import '../remote/data_source/astro_remote_data_source.dart';

class AstroRepositoryImpl implements AstroRepository {
  AstroRepositoryImpl({
    required AstroRemoteDataSource astroRemoteDataSource,
    required AstroCacheDataSource astroCacheDataSource,
  })  : _astroRemoteDataSource = astroRemoteDataSource,
        _astroCacheDataSource = astroCacheDataSource;

  final AstroRemoteDataSource _astroRemoteDataSource;
  final AstroCacheDataSource _astroCacheDataSource;

  @override
  Future<BodyDetailsModel> getBodyDetailsModel(
          BodyModel bodyModel, String bodyId) async =>
      _astroRemoteDataSource.getBodyDetailsModel(bodyModel, bodyId);

  @override
  Future<BodyListDataModel> getBodyList() async =>
      _astroRemoteDataSource.getBodyList();

  @override
  Future<ImageDataModel> getMoonPhaseImage(
          MoonPhaseModel moonPhaseModel) async =>
      _astroRemoteDataSource.getMoonPhaseImage(moonPhaseModel);

  @override
  Future<ImageDataModel> getStarChartImage(
          StarChartModel starChartModel) async =>
      _astroRemoteDataSource.getStarChartImage(starChartModel);

  @override
  Future<void> saveMoonPhaseImage(
          ImageDataModel imageDataModel, String id) async =>
      _astroCacheDataSource.saveMoonPhaseImage(imageDataModel, id);

  @override
  Future<void> deleteMoonPhaseImage(String id) async =>
      _astroCacheDataSource.deleteMoonPhaseImage(id);

  @override
  Future<List<ImageDataModel>> getMoonPhaseImageList() async =>
      _astroCacheDataSource.getMoonPhaseImageList();

  @override
  Future<bool> verifyIfImageIsSaved(String id) async =>
      _astroCacheDataSource.verifyIfImageIsSaved(id);
}

import '../../domain/model/body/body_details_model.dart';
import '../../domain/model/body/body_list_data_model.dart';
import '../../domain/model/body/body_model.dart';
import '../../domain/model/image_url/image_data_model.dart';
import '../../domain/model/moon_phase/moon_phase_model.dart';
import '../../domain/model/star_chart/star_chart_model.dart';
import '../../domain/repository/astro_repository.dart';
import '../remote/data_source/astro_remote_data_source.dart';

class AstroRepositoryImpl implements AstroRepository {
  AstroRepositoryImpl({
    required AstroRemoteDataSource astroRemoteDataSource,
  }) : _astroRemoteDataSource = astroRemoteDataSource;

  final AstroRemoteDataSource _astroRemoteDataSource;

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
}

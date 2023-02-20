import '../../../domain/model/body/body_details_model.dart';
import '../../../domain/model/body/body_list_data_model.dart';
import '../../../domain/model/body/body_model.dart';
import '../../../domain/model/image_url/image_data_model.dart';
import '../../../domain/model/moon_phase/moon_phase_model.dart';
import '../../../domain/model/star_chart/star_chart_model.dart';

abstract class AstroRemoteDataSource {
  Future<ImageDataModel> getMoonPhaseImage(MoonPhaseModel moonPhaseModel);

  Future<BodyDetailsModel> getBodyDetailsModel(
    BodyModel bodyModel,
    String bodyId,
  );

  Future<ImageDataModel> getStarChartImage(StarChartModel starChartModel);

  Future<BodyListDataModel> getBodyList();
}

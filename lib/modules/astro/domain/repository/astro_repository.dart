import '../model/body/body_details_model.dart';
import '../model/body/body_list_data_model.dart';
import '../model/body/body_model.dart';
import '../model/image_url/image_data_model.dart';
import '../model/moon_phase/moon_phase_model.dart';
import '../model/star_chart/star_chart_model.dart';

abstract class AstroRepository {
  Future<ImageDataModel> getMoonPhaseImage(MoonPhaseModel moonPhaseModel);

  Future<BodyDetailsModel> getBodyDetailsModel(
    BodyModel bodyModel,
    String bodyId,
  );

  Future<ImageDataModel> getStarChartImage(StarChartModel starChartModel);

  Future<BodyListDataModel> getBodyList();
}

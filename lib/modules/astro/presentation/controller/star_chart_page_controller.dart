import 'package:flutter/cupertino.dart';
import 'package:observador_app/modules/astro/domain/model/image_url/image_data_model.dart';

import '../../domain/exception/authentication_exception.dart';
import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/model/observer/observer_model.dart';
import '../../domain/model/star_chart/star_chart_model.dart';
import '../../domain/model/star_chart/star_chart_view_model.dart';
import '../../domain/model/star_chart/star_chart_view_parameters_model.dart';
import '../../domain/use_case/get_star_chart_image_use_case.dart';
import '../../utils/date_time_extensions.dart';
import '../page/star_chart_page_state.dart';

class StarChartPageController extends ValueNotifier<StarChartPageState> {
  StarChartPageController({
    required GetStarChartImageUseCase getStarChartImageUseCase,
  })  : _getStarChartImageUseCase = getStarChartImageUseCase,
        super(StarChartPageState.initState);

  final GetStarChartImageUseCase _getStarChartImageUseCase;
  List<String> starChartList = ['andromeda', 'pegasus', 'orion'];
  String? selectedStarChart;
  ImageDataModel? image;

  Future<void> getStarChartImage({
    required double latitude,
    required double longitude,
    required String constellation,
  }) async {
    value = StarChartPageState.loading;
    final date = DateTime.now().formatDate(true);
    final starChartModel = StarChartModel(
      style: 'default',
      observer: ObserverModel(
        latitude: latitude,
        longitude: longitude,
        date: date,
      ),
      view: StarChartViewModel(
        type: 'constellation',
        parameters: StarChartViewParametersModel(
          constellation: constellation.substring(0, 3),
        ),
      ),
    );
    try {
      image =
          await _getStarChartImageUseCase.getStarChartImage(starChartModel);
      print(image!.data.imageUrl);
      value = StarChartPageState.success;
    } on GenericErrorStatusCodeException {
      value = StarChartPageState.genericError;
    } on NetworkErrorException {
      value = StarChartPageState.networkError;
    } on AuthenticationException {
      value = StarChartPageState.authError;
    } catch (e) {
      value = StarChartPageState.genericError;
    }
  }
}

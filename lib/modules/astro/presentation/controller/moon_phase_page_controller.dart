import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import '../../domain/exception/authentication_exception.dart';
import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/model/image_url/image_data_model.dart';
import '../../domain/model/moon_phase/moon_phase_model.dart';
import '../../domain/model/moon_phase/moon_phase_style_model.dart';
import '../../domain/model/moon_phase/moon_phase_view_model.dart';
import '../../domain/model/observer/observer_model.dart';
import '../../domain/use_case/get_moon_phase_image_use_case.dart';
import '../page/moon_phase_page_state.dart';

class MoonPhasePageController extends ValueNotifier<MoonPhasePageState> {
  MoonPhasePageController({
    required GetMoonPhaseImageUseCase getMoonPhaseImageUseCase,
  })  : _getMoonPhaseImageUseCase = getMoonPhaseImageUseCase,
        super(MoonPhasePageState.loading);

  final GetMoonPhaseImageUseCase _getMoonPhaseImageUseCase;

  ImageDataModel? image;
  DateTime selectedDate = DateTime.now();

  Future<void> getMoonPhaseImage({
    required double latitude,
    required double longitude,
    required String date,
  }) async {
    final moonPhaseModel = MoonPhaseModel(
      format: 'png',
      style: MoonPhaseStyleModel(
        moonStyle: 'sketch',
        backgroundStyle: 'stars',
        backgroundColor: 'red',
        headingColor: 'white',
        textColor: 'white',
      ),
      observer: ObserverModel(
        latitude: latitude,
        longitude: longitude,
        date: date,
      ),
      view: MoonPhaseViewModel(
        type: 'portrait-simple',
        orientation: 'south-up',
      ),
    );
    value = MoonPhasePageState.loading;
    try {
      image = await _getMoonPhaseImageUseCase.getMoonPhaseImage(moonPhaseModel);
      value = MoonPhasePageState.success;
    } on GenericErrorStatusCodeException {
      value = MoonPhasePageState.genericError;
    } on NetworkErrorException {
      value = MoonPhasePageState.networkError;
    } on AuthenticationException {
      value = MoonPhasePageState.authError;
    } catch (e) {
      value = MoonPhasePageState.genericError;
    }
  }
}

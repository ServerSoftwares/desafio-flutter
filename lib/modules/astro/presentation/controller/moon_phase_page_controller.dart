import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import '../../domain/exception/authentication_exception.dart';
import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/model/image_url/image_data_model.dart';
import '../../domain/model/moon_phase/moon_phase_model.dart';
import '../../domain/model/moon_phase/moon_phase_style_model.dart';
import '../../domain/model/moon_phase/moon_phase_view_model.dart';
import '../../domain/model/observer/observer_model.dart';
import '../../domain/use_case/get_moon_phase_image_use_case.dart';
import '../../domain/use_case/get_position_use_case.dart';
import '../../domain/use_case/verify_if_location_permission_is_enabled_use_case.dart';
import '../page/moon_phase_page_state.dart';

class MoonPhasePageController extends ValueNotifier<MoonPhasePageState> {
  MoonPhasePageController({
    required GetMoonPhaseImageUseCase getMoonPhaseImageUseCase,
    required GetPositionUseCase getPositionUseCase,
    required VerifyIfLocationPermissionIsEnabledUseCase
        verifyIfLocationPermissionIsEnabledUseCase,
  })  : _getMoonPhaseImageUseCase = getMoonPhaseImageUseCase,
        _getPositionUseCase = getPositionUseCase,
        _verifyIfLocationPermissionIsEnabledUseCase =
            verifyIfLocationPermissionIsEnabledUseCase,
        super(MoonPhasePageState.loading);

  final GetMoonPhaseImageUseCase _getMoonPhaseImageUseCase;
  final GetPositionUseCase _getPositionUseCase;
  final VerifyIfLocationPermissionIsEnabledUseCase
      _verifyIfLocationPermissionIsEnabledUseCase;

  ImageDataModel? image;
  DateTime selectedDate = DateTime.now();
  Position? currentPosition;

  Future<void> getMoonPhaseImage({
    required String date,
  }) async {
    try {
      value = MoonPhasePageState.loading;

      final isAllowed =
          await _verifyIfLocationPermissionIsEnabledUseCase.call();
      if (isAllowed) {
        currentPosition = await _getPositionUseCase.call();
        final moonPhaseModel = MoonPhaseModel(
          format: DefaultParameters.format,
          style: const MoonPhaseStyleModel(
            moonStyle: DefaultParameters.moonStyle,
            backgroundStyle: DefaultParameters.backgroundStyle,
            backgroundColor: DefaultParameters.backgroundColor,
            headingColor: DefaultParameters.headingColor,
            textColor: DefaultParameters.textColor,
          ),
          observer: ObserverModel(
            latitude: currentPosition!.latitude,
            longitude: currentPosition!.longitude,
            date: date,
          ),
          view: const MoonPhaseViewModel(
            type: DefaultParameters.type,
            orientation: DefaultParameters.orientation,
          ),
        );
        image =
            await _getMoonPhaseImageUseCase.call(moonPhaseModel);
        value = MoonPhasePageState.success;
      } else {
        value = MoonPhasePageState.positionError;
        return;
      }
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

class DefaultParameters {
  static const format = 'png';
  static const moonStyle = 'sketch';
  static const backgroundStyle = 'stars';
  static const backgroundColor = 'red';
  static const headingColor = 'white';
  static const textColor = 'white';
  static const type = 'portrait-simple';
  static const orientation = 'south-up';
}

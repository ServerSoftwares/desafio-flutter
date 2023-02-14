import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

import '../../domain/exception/authentication_exception.dart';
import '../../domain/exception/generic_error_status_code_exception.dart';
import '../../domain/exception/network_error_exception.dart';
import '../../domain/model/body/body_model.dart';
import '../../domain/model/body/table/body_table_rows_model.dart';
import '../../domain/use_case/get_body_list_details_model_use_case.dart';
import '../../domain/use_case/get_body_list_use_case.dart';
import '../../utils/date_time_extensions.dart';
import '../page/celestial_body_page_state.dart';

class CelestialBodyPageController
    extends ValueNotifier<CelestialBodyPageState> {
  CelestialBodyPageController({
    required GetBodyListUseCase getBodyListUseCase,
    required GetBodyDetailsModelUseCase getBodyDetailsModelUseCase,
  })  : _getBodyListUseCase = getBodyListUseCase,
        _getBodyDetailsModelUseCase = getBodyDetailsModelUseCase,
        super(CelestialBodyPageState.loading);

  final GetBodyListUseCase _getBodyListUseCase;
  final GetBodyDetailsModelUseCase _getBodyDetailsModelUseCase;

  List<String>? bodyList;
  String? selectedBody;
  List<BodyTableRowsModel>? rows;
  bool hasLoadedList = false;

  Future<void> getBodyList() async {
    value = CelestialBodyPageState.loading;
    try {
      final bodyListData = await _getBodyListUseCase.getBodyList();
      value = CelestialBodyPageState.listSuccess;
      bodyList = bodyListData.data.bodies;
      selectedBody = bodyList!.first;
      hasLoadedList = true;
    } on GenericErrorStatusCodeException {
      value = CelestialBodyPageState.genericError;
    } on NetworkErrorException {
      value = CelestialBodyPageState.networkError;
    } on AuthenticationException {
      value = CelestialBodyPageState.authError;
    } catch (e) {
      value = CelestialBodyPageState.genericError;
    }
  }

  Future<void> getBodyDetailsModel({
    required String bodyId,
    required double latitude,
    required double longitude,
  }) async {
    value = CelestialBodyPageState.loading;
    
    final toDate = DateTime.now();
    final fromDate = toDate.subtract(const Duration(days: 6));
    final time = DateFormat.Hms().format(toDate);

    final bodyModel = BodyModel(
      latitude: latitude,
      longitude: longitude,
      fromDate: fromDate.formatDate(true),
      toDate: toDate.formatDate(true),
      time: time,
      elevation: 0,
    );
    try {
      final bodyDetails = await _getBodyDetailsModelUseCase.getBodyDetailsModel(
          bodyModel, bodyId);
      rows = bodyDetails.data.table.rows;
      value = CelestialBodyPageState.detailsSuccess;
    } on GenericErrorStatusCodeException {
      value = CelestialBodyPageState.genericError;
    } on NetworkErrorException {
      value = CelestialBodyPageState.networkError;
    } on AuthenticationException {
      value = CelestialBodyPageState.authError;
    } catch (e) {
      value = CelestialBodyPageState.genericError;
    }
  }
}

import 'package:flutter/foundation.dart';

import '../../domain/model/image_url/image_data_model.dart';
import '../../domain/use_case/delete_moon_phase_image_use_case.dart';
import '../../domain/use_case/get_moon_phase_image_list_use_case.dart';
import '../page/moon_phase_image_list_page_state.dart';

class MoonPhaseImageListPageController
    extends ValueNotifier<MoonPhaseImageListPageState> {
  MoonPhaseImageListPageController({
    required GetMoonPhaseImageList getMoonPhaseImageList,
    required DeleteMoonPhaseImageUseCase deleteMoonPhaseImageUseCase,
  })  : _getMoonPhaseImageList = getMoonPhaseImageList,
        _deleteMoonPhaseImageUseCase = deleteMoonPhaseImageUseCase,
        super(MoonPhaseImageListPageState.loading);

  final GetMoonPhaseImageList _getMoonPhaseImageList;
  final DeleteMoonPhaseImageUseCase _deleteMoonPhaseImageUseCase;

  List<ImageDataModel> imageList = [];

  Future<void> getMoonPhaseImageList() async {
    value = MoonPhaseImageListPageState.loading;
    imageList = await _getMoonPhaseImageList.call();
    if (imageList.isEmpty) {
      value = MoonPhaseImageListPageState.emptyList;
    } else {
      value = MoonPhaseImageListPageState.success;
    }
  }

  Future<void> deleteMoonPhaseImage(String id) async {
    await _deleteMoonPhaseImageUseCase.call(id);
  }
}

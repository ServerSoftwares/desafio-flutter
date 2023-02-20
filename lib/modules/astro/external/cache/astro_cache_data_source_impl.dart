import 'package:hive/hive.dart';

import '../../data/cache/astro_cache_data_source.dart';
import '../../data/mapper/cache_to_domain.dart';
import '../../data/mapper/domain_to_cache.dart';
import '../../domain/model/image_url/image_data_cache.dart';
import '../../domain/model/image_url/image_data_model.dart';

class AstroCacheDataSourceImpl implements AstroCacheDataSource {
  AstroCacheDataSourceImpl({
    required HiveInterface hiveInterface,
  }) : _hiveInterface = hiveInterface;

  final HiveInterface _hiveInterface;

  @override
  Future<void> saveMoonPhaseImage(
      ImageDataModel imageDataModel, String id) async {
    final imageDataCache = imageDataModel.toImageDataCache();
    final box = await _hiveInterface.openBox('imagedatabox');
    await box.put(id, imageDataCache);
  }

  @override
  Future<void> deleteMoonPhaseImage(String id) async {
    final box = await _hiveInterface.openBox('imagedatabox');
    await box.delete(id);
  }

  @override
  Future<List<ImageDataModel>> getMoonPhaseImageList() async {
    final box = await _hiveInterface.openBox('imagedatabox');
    final boxMap = box.toMap();
    final imageDataCacheList = List<ImageDataCache>.from(boxMap.values);
    return imageDataCacheList
        .map((element) => element.toImageDataModel())
        .toList();
  }

  @override
  Future<bool> verifyIfImageIsSaved(String id) async {
    final box = await _hiveInterface.openBox('imagedatabox');
    final boxKeys = box.toMap().keys.map((key) => key.toString()).toList();
    if (boxKeys.contains(id)) {
      return true;
    } else {
      return false;
    }
  }
}

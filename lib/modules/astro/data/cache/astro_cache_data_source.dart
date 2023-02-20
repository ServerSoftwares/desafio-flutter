import '../../domain/model/image_url/image_data_model.dart';

abstract class AstroCacheDataSource {
  Future<void> saveMoonPhaseImage(ImageDataModel imageDataModel, String id);

  Future<void> deleteMoonPhaseImage(String id);

  Future<List<ImageDataModel>> getMoonPhaseImageList();

  Future<bool> verifyIfImageIsSaved(String id);
}

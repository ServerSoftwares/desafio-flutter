import '../../domain/model/image_url/image_data_cache.dart';
import '../../domain/model/image_url/image_data_model.dart';
import '../../domain/model/image_url/image_model.dart';

extension ImageDataCacheToImageDataModel on ImageDataCache {
  ImageDataModel toImageDataModel() => ImageDataModel(
        data: ImageModel(
          imageUrl: data.imageUrl,
        ),
      );
}

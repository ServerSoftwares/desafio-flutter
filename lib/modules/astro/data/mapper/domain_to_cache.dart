import '../../domain/model/image_url/image_url_cache.dart';
import '../../domain/model/image_url/image_data_cache.dart';
import '../../domain/model/image_url/image_data_model.dart';

extension ImageDataModelToImageDataCache on ImageDataModel {
  ImageDataCache toImageDataCache() => ImageDataCache(
        data: ImageUrlCache(
          imageUrl: data.imageUrl,
        ),
      );
}

import 'package:hive/hive.dart';

import 'image_url_cache.dart';

part 'image_data_cache.g.dart';

@HiveType(typeId: 1)
class ImageDataCache {
  ImageDataCache({
   required this.data,
  });

  @HiveField(0)
  final ImageUrlCache data;
}

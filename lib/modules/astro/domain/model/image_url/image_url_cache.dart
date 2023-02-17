import 'package:hive/hive.dart';

part 'image_url_cache.g.dart';

@HiveType(typeId: 0)
class ImageUrlCache {
  ImageUrlCache({
    required this.imageUrl,
  });
  @HiveField(0)
  final String imageUrl;
}

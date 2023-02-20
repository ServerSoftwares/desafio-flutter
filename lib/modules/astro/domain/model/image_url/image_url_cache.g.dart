// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_url_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageUrlCacheAdapter extends TypeAdapter<ImageUrlCache> {
  @override
  final int typeId = 0;

  @override
  ImageUrlCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageUrlCache(
      imageUrl: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ImageUrlCache obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageUrlCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

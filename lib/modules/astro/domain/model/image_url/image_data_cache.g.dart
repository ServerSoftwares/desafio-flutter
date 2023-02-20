// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_data_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImageDataCacheAdapter extends TypeAdapter<ImageDataCache> {
  @override
  final int typeId = 1;

  @override
  ImageDataCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ImageDataCache(
      data: fields[0] as ImageUrlCache,
    );
  }

  @override
  void write(BinaryWriter writer, ImageDataCache obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImageDataCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

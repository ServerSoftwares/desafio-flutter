import 'package:json_annotation/json_annotation.dart';

import '../image/image_response.dart';

part 'image_data_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageDataResponse {
  ImageDataResponse({
    this.data,
  });

  factory ImageDataResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageDataResponseFromJson(json);

  final ImageResponse? data;

  Map<String, dynamic> toJson() => _$ImageDataResponseToJson(this);
}

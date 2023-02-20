import 'package:json_annotation/json_annotation.dart';

part 'image_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ImageResponse {
  ImageResponse({
    this.imageUrl,
  });

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);

  @JsonKey(name: 'imageUrl')
  final String? imageUrl;

  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}

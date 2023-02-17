import 'package:equatable/equatable.dart';

import 'image_model.dart';

class ImageDataModel extends Equatable {
  const ImageDataModel({
    required this.data,
  });

  final ImageModel data;

  @override
  List<Object?> get props => [
        data,
      ];
}

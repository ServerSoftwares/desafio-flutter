import 'package:equatable/equatable.dart';

class ImageModel extends Equatable {
  const ImageModel({
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  List<Object?> get props => [
        imageUrl,
      ];
}

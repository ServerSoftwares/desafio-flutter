import 'package:flutter/material.dart';

import '../../../constants/astro_constant_images.dart';

class CustomImageLoader extends StatelessWidget {
  const CustomImageLoader({
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) => InteractiveViewer(
        panEnabled: false,
        minScale: 1,
        maxScale: 2,
        child: FadeInImage(
          fit: BoxFit.fitWidth,
          alignment: Alignment.topCenter,
          placeholderFit: BoxFit.scaleDown,
          image: NetworkImage(imageUrl),
          placeholder: const AssetImage(AstroConstantsImages.loadingImage),
          imageErrorBuilder: (content, error, stackTrace) => Image.asset(
            AstroConstantsImages.errorImage,
            width: 100,
            height: 180,
            alignment: Alignment.center,
          ),
        ),
      );
}

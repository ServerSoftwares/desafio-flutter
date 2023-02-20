import 'package:flutter/material.dart';

import '../constants/astro_constant_colors.dart';
import 'custom_image_loader.dart';

class CustomMoonPhaseImageWidget extends StatelessWidget {
  const CustomMoonPhaseImageWidget({
    required this.imageUrl,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String imageUrl;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: CustomImageLoader(
              imageUrl: imageUrl,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: const EdgeInsets.all(10),
            child: InkWell(
              onTap: onTap,
              child: Icon(
                icon,
                color: AstroConstantColors.secondaryColor,
                size: 30,
              ),
            ),
          ),
        ],
      );
}

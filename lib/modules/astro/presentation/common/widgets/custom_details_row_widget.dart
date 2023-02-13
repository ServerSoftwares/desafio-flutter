import 'package:flutter/material.dart';

import '../constants/astro_constant_colors.dart';

class CustomDetailsRowWidget extends StatelessWidget {
  const CustomDetailsRowWidget({
    required this.detail,
    required this.label,
    Key? key,
  }) : super(key: key);

  final String detail;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Flexible(
            child: Text(
              label,
              style: const TextStyle(
                color: AstroConstantColors.secondaryColor,
                fontSize: 16,
              ),
            ),
          ),
          Flexible(
            child: Text(
              detail,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      );
}

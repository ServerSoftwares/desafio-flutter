import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../constants/astro_constant_colors.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({
    required this.errorText,
    required this.onClickButton,
    required this.textColor,
    Key? key,
  }) : super(key: key);

  final String errorText;
  final Function() onClickButton;
  final Color textColor;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: InkWell(
              onTap: onClickButton,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: const BoxDecoration(
                  color: AstroConstantColors.secondaryColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Text(
                  S.of(context).tryAgain,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      );
}

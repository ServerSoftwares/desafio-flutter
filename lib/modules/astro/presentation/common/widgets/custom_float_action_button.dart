import 'package:flutter/material.dart';

import '../constants/astro_constant_colors.dart';

class CustomFloatActionButton extends StatelessWidget {
  const CustomFloatActionButton({
    required this.icon,
    required this.onClickButton,
    Key? key,
  }) : super(key: key);

  final IconData icon;
  final Function() onClickButton;

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onClickButton,
    child: Container(
      decoration: BoxDecoration(
        color: AstroConstantColors.lightGreen,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,// changes position of shadow
          ),
        ],
      ),
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    ),
  );
}
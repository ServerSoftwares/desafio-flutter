import 'package:flutter/material.dart';

import '../../../../../generated/l10n.dart';
import '../../../utils/date_time_extensions.dart';
import '../../../utils/string_extensions.dart';
import '../constants/astro_constant_colors.dart';
import 'custom_details_row_widget.dart';

class CustomCelestialBodyDetailsWidget extends StatelessWidget {
  const CustomCelestialBodyDetailsWidget({
    required this.date,
    required this.degrees,
    required this.distance,
    Key? key,
  }) : super(key: key);

  final String date;
  final String degrees;
  final String distance;

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.parse(date.substring(0, 10));
    final time = date.substring(11, 19);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Container(
            decoration: const BoxDecoration(
              color: AstroConstantColors.lightGreen,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              '${dateTime.formatDate(false)} - $time GMT',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        CustomDetailsRowWidget(
          detail: degrees.formatAsDouble(2),
          label: S.of(context).celestialBodyPagePickBodyPosition,
        ),
        const SizedBox(height: 10),
        CustomDetailsRowWidget(
          detail: distance.formatAsDouble(2),
          label: S.of(context).celestialBodyPagePickBodyDistance,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

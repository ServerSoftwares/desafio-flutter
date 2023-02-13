import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:observador_app/modules/astro/utils/string_extensions.dart';

import '../../../utils/date_time_extensions.dart';
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
    final dateTime = DateTime.parse(date);
    final time = DateFormat.Hms().format(dateTime);
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
              '${dateTime.formatDate(false)} - $time',
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
          label: 'Posição (graus): ',
        ),
        const SizedBox(height: 10),
        CustomDetailsRowWidget(
          detail: distance.formatAsDouble(2),
          label: 'Distância da Terra (km): ',
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

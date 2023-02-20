import 'package:flutter/material.dart';
import 'package:observador_app/modules/astro/presentation/common/widgets/custom_moon_phase_image_widget.dart';
import 'package:widgetbook/widgetbook.dart';

class CustomMoonPhaseImageWidgetComponent extends WidgetbookWidget {
  CustomMoonPhaseImageWidgetComponent()
      : super(
          name: 'CustomMoonPhaseImageWidgetComponent',
          useCases: [
            WidgetbookUseCase(
              name: 'default',
              builder: (context) => Center(
                child: CustomMoonPhaseImageWidget(
                    imageUrl:
                        'https://widgets.astronomyapi.com/moon-phase/generated/51f3338b2a4b69f9f825e7d06aea191ab16e8c908a893b2a784cd5d82d662ffe.png',
                    icon: Icons.favorite,
                    onTap: () {}),
              ),
            ),
          ],
        );
}

import 'package:flutter/material.dart';
import 'package:observador_app/modules/astro/presentation/common/widgets/custom_float_action_button.dart';
import 'package:widgetbook/widgetbook.dart';

class CustomFloatActionButtonComponent extends WidgetbookWidget {
  CustomFloatActionButtonComponent()
      : super(
          name: 'CustomFloatActionButtonComponent',
          useCases: [
            WidgetbookUseCase(
              name: 'default',
              builder: (context) => Center(
                child: CustomFloatActionButton(
                  icon: Icons.star,
                  onClickButton: () {},
                ),
              ),
            ),
          ],
        );
}

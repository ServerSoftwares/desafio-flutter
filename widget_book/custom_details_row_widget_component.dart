import 'package:flutter/cupertino.dart';
import 'package:observador_app/modules/astro/presentation/common/widgets/custom_details_row_widget.dart';
import 'package:widgetbook/widgetbook.dart';

class CustomDetailsRowWidgetComponent extends WidgetbookWidget {
  CustomDetailsRowWidgetComponent()
      : super(
          name: 'CustomDetailsRowWidgetComponent',
          useCases: [
            WidgetbookUseCase(
              name: 'default',
              builder: (context) => const Center(
                child: CustomDetailsRowWidget(
                  detail: 'info',
                  label: 'detalhe',
                ),
              ),
            ),
            WidgetbookUseCase(
              name: 'default2',
              builder: (context) => const Center(
                child: CustomDetailsRowWidget(
                  detail: 'info2',
                  label: 'detalhe2',
                ),
              ),
            ),
          ],
        );
}

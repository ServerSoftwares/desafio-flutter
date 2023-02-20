import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'custom_details_row_widget_component.dart';
import 'custom_float_action_button_component.dart';
import 'custom_image_loader_component.dart';
import 'custom_moon_phase_image_widget_component.dart';

void main() {
  runApp(const MyWidgetbook());
}

class MyWidgetbook extends StatelessWidget {
  const MyWidgetbook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Widgetbook(
        categories: [
          WidgetbookCategory(
            name: 'My App',
            folders: [
              WidgetbookFolder(
                name: 'Components',
                widgets: [
                  CustomDetailsRowWidgetComponent(),
                  CustomFloatActionButtonComponent(),
                  CustomImageLoaderComponent(),
                  CustomMoonPhaseImageWidgetComponent(),
                ],
              ),
            ],
          ),
        ],
        appInfo: AppInfo(name: 'My App'),
        lightTheme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
      );
}

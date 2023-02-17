import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../generated/l10n.dart';
import '../../utils/string_extensions.dart';
import '../common/constants/astro_constant_colors.dart';
import '../common/widgets/custom_error_widget.dart';
import '../common/widgets/custom_image_loader.dart';
import '../controller/star_chart_page_controller.dart';
import 'star_chart_page_state.dart';

class StarChartPage extends StatefulWidget {
  const StarChartPage({
    required this.latitude,
    required this.longitude,
    Key? key,
  }) : super(key: key);

  final double latitude;
  final double longitude;

  @override
  State<StarChartPage> createState() => _StarChartPageState();
}

class _StarChartPageState extends State<StarChartPage> {
  final StarChartPageController controller =
      Modular.get<StarChartPageController>();

  @override
  void initState() {
    super.initState();
    controller.selectedStarChart = controller.starChartList.first;
  }

  Future<void> reload() async => controller.getStarChartImage(
        latitude: widget.latitude,
        longitude: widget.longitude,
        constellation: controller.selectedStarChart!,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).starChartPageAppBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                S.of(context).starChatPagePickConstellation,
                style: const TextStyle(fontSize: 18),
              ),
              Center(
                child: DropdownButton<String>(
                  value: controller.selectedStarChart,
                  items: controller.starChartList
                      .map(
                        (starChart) => DropdownMenuItem<String>(
                          value: starChart,
                          child: Text(
                            starChart.capitalize(),
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (selectedStarChart) {
                    setState(
                        () => controller.selectedStarChart = selectedStarChart);
                    controller.getStarChartImage(
                      latitude: widget.latitude,
                      longitude: widget.longitude,
                      constellation: selectedStarChart!,
                    );
                  },
                  underline: Container(
                    height: 2,
                    color: AstroConstantColors.lightGreen,
                  ),
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: AstroConstantColors.lightGreen,
                    size: 35,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: ValueListenableBuilder<StarChartPageState>(
                    valueListenable: controller,
                    builder: (context, state, _) {
                      switch (state) {
                        case StarChartPageState.initState:
                          return const Padding(padding: EdgeInsets.zero);
                        case StarChartPageState.loading:
                          return const CircularProgressIndicator();
                        case StarChartPageState.authError:
                          return CustomErrorWidget(
                            errorText: S.of(context).genericError,
                            onClickButton: reload,
                            textColor: Colors.black87,
                          );
                        case StarChartPageState.genericError:
                          return CustomErrorWidget(
                            errorText: S.of(context).genericError,
                            onClickButton: reload,
                            textColor: Colors.black87,
                          );
                        case StarChartPageState.networkError:
                          return CustomErrorWidget(
                            errorText: S.of(context).failedConnection,
                            onClickButton: reload,
                            textColor: Colors.black87,
                          );
                        case StarChartPageState.success:
                          return SingleChildScrollView(
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              child: CustomImageLoader(
                                imageUrl: controller.image!.data.imageUrl,
                              ),
                            ),
                          );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}

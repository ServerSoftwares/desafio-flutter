import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../generated/l10n.dart';
import '../../utils/string_extensions.dart';
import '../common/constants/astro_constant_colors.dart';
import '../common/widgets/custom_celestial_body_details_widget.dart';
import '../common/widgets/custom_error_widget.dart';
import '../controller/celestial_body_page_controller.dart';
import 'celestial_body_page_state.dart';

class CelestialBodyPage extends StatefulWidget {
  const CelestialBodyPage({
    required this.latitude,
    required this.longitude,
    Key? key,
  }) : super(key: key);

  final double latitude;
  final double longitude;

  @override
  State<CelestialBodyPage> createState() => _CelestialBodyPageState();
}

class _CelestialBodyPageState extends State<CelestialBodyPage> {
  final CelestialBodyPageController controller =
      Modular.get<CelestialBodyPageController>();

  @override
  void initState() {
    super.initState();
    controller.getBodyList();
  }

  Future<void> reload() async {
    if (!controller.hasLoadedList) {
      await controller.getBodyList();
    } else {
      await controller.getBodyDetailsModel(
        bodyId: controller.selectedBody!,
        latitude: widget.latitude,
        longitude: widget.longitude,
      );
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).celestialBodyPageAppBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder<CelestialBodyPageState>(
                valueListenable: controller,
                builder: (context, state, _) {
                  if (state == CelestialBodyPageState.listSuccess ||
                      state == CelestialBodyPageState.detailsSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).celestialBodyPagePickBody,
                          style: const TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: DropdownButton<String>(
                            value: controller.selectedBody,
                            items: controller.displayedBodyList
                                .map(
                                  (body) => DropdownMenuItem<String>(
                                    value: body,
                                    child: Text(
                                      body.capitalize(),
                                      style: const TextStyle(fontSize: 18),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (selectedBody) {
                              setState(
                                  () => controller.selectedBody = selectedBody);
                              controller.getBodyDetailsModel(
                                bodyId: controller.selectedBody!,
                                latitude: widget.latitude,
                                longitude: widget.longitude,
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
                      ],
                    );
                  }
                  return const Padding(padding: EdgeInsets.zero);
                },
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ValueListenableBuilder<CelestialBodyPageState>(
                  valueListenable: controller,
                  builder: (context, state, _) {
                    switch (state) {
                      case CelestialBodyPageState.loading:
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      case CelestialBodyPageState.authError:
                        return CustomErrorWidget(
                          errorText: S.of(context).genericError,
                          onClickButton: reload,
                          textColor: Colors.black87,
                        );
                      case CelestialBodyPageState.genericError:
                        return CustomErrorWidget(
                          errorText: S.of(context).genericError,
                          onClickButton: reload,
                          textColor: Colors.black87,
                        );
                      case CelestialBodyPageState.networkError:
                        return CustomErrorWidget(
                          errorText: S.of(context).failedConnection,
                          onClickButton: reload,
                          textColor: Colors.black87,
                        );
                      case CelestialBodyPageState.listEmpty:
                        return CustomErrorWidget(
                          errorText: S.of(context).failedConnection,
                          onClickButton: reload,
                          textColor: Colors.black87,
                        );
                      case CelestialBodyPageState.detailsSuccess:
                        return SingleChildScrollView(
                          child: Column(
                            children: List.generate(
                              controller.rows!.length,
                              (index) => Column(
                                children: List.generate(
                                  controller.rows![index].cells.length,
                                  (index2) {
                                    final cell =
                                        controller.rows![index].cells[index2];
                                    return CustomCelestialBodyDetailsWidget(
                                      date: cell.date,
                                      degrees: cell
                                          .position.horizonal.altitude.degrees,
                                      distance:
                                          cell.distance.fromEarth.km.toString(),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      case CelestialBodyPageState.listSuccess:
                        return const Padding(padding: EdgeInsets.zero);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
}

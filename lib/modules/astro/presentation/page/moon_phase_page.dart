import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../generated/l10n.dart';
import '../../constants/astro_constant_routes.dart';
import '../../utils/date_time_extensions.dart';
import '../common/constants/astro_constant_colors.dart';
import '../common/widgets/custom_error_widget.dart';
import '../common/widgets/custom_float_action_button.dart';
import '../common/widgets/custom_image_loader.dart';
import '../controller/moon_phase_page_controller.dart';
import 'moon_phase_page_state.dart';

class MoonPhasePage extends StatefulWidget {
  const MoonPhasePage({Key? key}) : super(key: key);

  @override
  State<MoonPhasePage> createState() => _MoonPhasePageState();
}

class _MoonPhasePageState extends State<MoonPhasePage> {
  final MoonPhasePageController controller =
      Modular.get<MoonPhasePageController>();

  @override
  void initState() {
    super.initState();
    controller.getMoonPhaseImage(
        date: controller.selectedDate.formatDate(true));
  }

  Future<void> reload() async {
    await controller.getMoonPhaseImage(
      date: controller.selectedDate.formatDate(true),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).moonPhasePageAppBarTitle),
        ),
        floatingActionButton: ValueListenableBuilder<MoonPhasePageState>(
          valueListenable: controller,
          builder: (context, state, _) {
            if (state == MoonPhasePageState.success) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomFloatActionButton(
                    icon: Icons.sunny,
                    onClickButton: () => Modular.to.pushNamed(
                        AstroConstantRoutes.celestialBodiesPage,
                        arguments: [
                          controller.currentPosition!.latitude,
                          controller.currentPosition!.longitude,
                        ]),
                  ),
                  CustomFloatActionButton(
                    icon: Icons.star,
                    onClickButton: () => Modular.to.pushNamed(
                        AstroConstantRoutes.starChartPage,
                        arguments: [
                          controller.currentPosition!.latitude,
                          controller.currentPosition!.longitude,
                        ]),
                  ),
                  CustomFloatActionButton(
                    icon: Icons.favorite,
                    onClickButton: () {},
                  ),
                ],
              );
            } else {
              return const Padding(padding: EdgeInsets.zero);
            }
          },
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Text(
                S.of(context).moonPhasePagePickDate,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => DatePicker.showDatePicker(
                  context,
                  onConfirm: (date) async {
                    setState(() => controller.selectedDate = date);
                    await controller.getMoonPhaseImage(
                      date: controller.selectedDate.formatDate(true),
                    );
                  },
                  maxTime: DateTime.now(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month_rounded,
                      size: 30,
                      color: AstroConstantColors.primaryColor,
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AstroConstantColors.lightGreen,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          controller.selectedDate.formatDate(false),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: Center(
                  child: ValueListenableBuilder<MoonPhasePageState>(
                    valueListenable: controller,
                    builder: (context, state, _) {
                      switch (state) {
                        case MoonPhasePageState.loading:
                          return const CircularProgressIndicator();
                        case MoonPhasePageState.authError:
                          return CustomErrorWidget(
                            errorText: S.of(context).genericError,
                            onClickButton: reload,
                            textColor: Colors.black87,
                          );
                        case MoonPhasePageState.genericError:
                          return CustomErrorWidget(
                            errorText: S.of(context).genericError,
                            onClickButton: reload,
                            textColor: Colors.black87,
                          );
                        case MoonPhasePageState.networkError:
                          return CustomErrorWidget(
                            errorText: S.of(context).failedConnection,
                            onClickButton: reload,
                            textColor: Colors.black87,
                          );
                        case MoonPhasePageState.success:
                          return SingleChildScrollView(
                            child: CustomImageLoader(
                              imageUrl: controller.image!.data.imageUrl,
                            ),
                          );
                        case MoonPhasePageState.positionError:
                          return CustomErrorWidget(
                            errorText: S.of(context).positionError,
                            onClickButton: reload,
                            textColor: Colors.black87,
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

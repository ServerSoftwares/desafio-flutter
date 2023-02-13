import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:observador_app/modules/astro/presentation/common/widgets/custom_celestial_body_details_widget.dart';

import '../../data/remote/data_source/astro_remote_data_source.dart';
import '../../data/repository/astro_repository_impl.dart';
import '../../domain/repository/astro_repository.dart';
import '../../domain/use_case/get_body_list_details_model_use_case.dart';
import '../../domain/use_case/get_body_list_use_case.dart';
import '../../external/remote_data_source/astro_remote_data_source_impl.dart';
import '../../utils/string_extensions.dart';
import '../common/constants/astro_constant_colors.dart';
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
  late Dio dio;
  late AstroRemoteDataSource astroRemoteDataSource;
  late AstroRepository astroRepository;
  late GetBodyListUseCase getBodyListUseCase;
  late GetBodyDetailsModelUseCase getBodyDetailsModelUseCase;
  late CelestialBodyPageController controller;

  @override
  void initState() {
    super.initState();
    dio = Dio();
    astroRemoteDataSource = AstroRemoteDataSourceImpl(dio: dio);
    astroRepository =
        AstroRepositoryImpl(astroRemoteDataSource: astroRemoteDataSource);
    getBodyListUseCase =
        GetBodyListUseCaseImpl(astroRepository: astroRepository);
    getBodyDetailsModelUseCase =
        GetBodyDetailsModelUseCaseImpl(astroRepository: astroRepository);
    controller = CelestialBodyPageController(
      getBodyListUseCase: getBodyListUseCase,
      getBodyDetailsModelUseCase: getBodyDetailsModelUseCase,
    );
    controller.getBodyList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Corpos Celestes',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selecione um corpo celeste:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder<CelestialBodyPageState>(
                  valueListenable: controller,
                  builder: (context, state, _) {
                    if (state == CelestialBodyPageState.listSuccess ||
                        state == CelestialBodyPageState.detailsSuccess) {
                      return Center(
                        child: DropdownButton<String>(
                          value: controller.selectedBody,
                          items: controller.bodyList!
                              .map(
                                (body) => DropdownMenuItem<String>(
                                  value: body,
                                  child: Text(
                                    body.capitalize(),
                                    style: const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                          onChanged: (selectedBody) {
                            setState(
                                () => controller.selectedBody = selectedBody);
                            controller.getBodyDetailsModel(
                              bodyId: selectedBody!,
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
                      );
                    }
                    return const Padding(padding: EdgeInsets.zero);
                  },
                ),
                const SizedBox(height: 10),
                ValueListenableBuilder<CelestialBodyPageState>(
                  valueListenable: controller,
                  builder: (context, state, _) {
                    switch (state) {
                      case CelestialBodyPageState.loading:
                        return const CircularProgressIndicator();
                      case CelestialBodyPageState.authError:
                        return CustomErrorWidget(
                          errorText: 'Ocorreu um erro!',
                          onClickButton: () {},
                          textColor: Colors.black87,
                        );
                      case CelestialBodyPageState.genericError:
                        return CustomErrorWidget(
                          errorText: 'Ocorreu um erro!',
                          onClickButton: () {},
                          textColor: Colors.black87,
                        );
                      case CelestialBodyPageState.networkError:
                        return CustomErrorWidget(
                          errorText: 'Falha na conexão!',
                          onClickButton: () {},
                          textColor: Colors.black87,
                        );
                      case CelestialBodyPageState.detailsSuccess:
                        return Column(
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
                        );
                      case CelestialBodyPageState.listSuccess:
                        return const Padding(padding: EdgeInsets.zero);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      );
}

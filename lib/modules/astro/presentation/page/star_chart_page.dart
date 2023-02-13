import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/remote/data_source/astro_remote_data_source.dart';
import '../../data/repository/astro_repository_impl.dart';
import '../../domain/repository/astro_repository.dart';
import '../../domain/use_case/get_star_chart_image_use_case.dart';
import '../../external/remote_data_source/astro_remote_data_source_impl.dart';
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
  late Dio dio;
  late AstroRemoteDataSource astroRemoteDataSource;
  late AstroRepository astroRepository;
  late GetStarChartImageUseCase getStarChartImageUseCase;
  late StarChartPageController controller;

  @override
  void initState() {
    super.initState();
    dio = Dio();
    astroRemoteDataSource = AstroRemoteDataSourceImpl(dio: dio);
    astroRepository =
        AstroRepositoryImpl(astroRemoteDataSource: astroRemoteDataSource);
    getStarChartImageUseCase =
        GetStarChartImageUseCaseImpl(astroRepository: astroRepository);
    controller = StarChartPageController(
        getStarChartImageUseCase: getStarChartImageUseCase);
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
          title: const Text(
            'Constelações',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Text(
                'Selecione uma constelação:',
                style: TextStyle(
                  fontSize: 18,
                ),
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
                            style: const TextStyle(
                              fontSize: 18,
                            ),
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
              const SizedBox(height: 50),
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
                            errorText: 'Ocorreu um erro!',
                            onClickButton: reload,
                            textColor: Colors.black87,
                          );
                        case StarChartPageState.genericError:
                          return CustomErrorWidget(
                            errorText: 'Ocorreu um erro!',
                            onClickButton: reload,
                            textColor: Colors.black87,
                          );
                        case StarChartPageState.networkError:
                          return CustomErrorWidget(
                            errorText: 'Falha na conexão!',
                            onClickButton: reload,
                            textColor: Colors.black87,
                          );
                        case StarChartPageState.success:
                          return SingleChildScrollView(
                            child: CustomImageLoader(
                              imageUrl: controller.image!.data.imageUrl,
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

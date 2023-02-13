import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:observador_app/modules/astro/presentation/page/star_chart_page.dart';

import '../../constants/astro_constant_fonts.dart';
import '../../data/remote/data_source/astro_remote_data_source.dart';
import '../../data/repository/astro_repository_impl.dart';
import '../../domain/repository/astro_repository.dart';
import '../../domain/use_case/get_moon_phase_image_use_case.dart';
import '../../external/remote_data_source/astro_remote_data_source_impl.dart';
import '../../utils/date_time_extensions.dart';
import '../common/constants/astro_constant_colors.dart';
import '../common/widgets/custom_error_widget.dart';
import '../common/widgets/custom_float_action_button.dart';
import '../common/widgets/custom_image_loader.dart';
import '../controller/moon_phase_page_controller.dart';
import 'celestial_body_page.dart';
import 'moon_phase_page_state.dart';

class MoonPhasePage extends StatefulWidget {
  const MoonPhasePage({Key? key}) : super(key: key);

  @override
  State<MoonPhasePage> createState() => _MoonPhasePageState();
}

class _MoonPhasePageState extends State<MoonPhasePage> {
  late Dio dio;
  late AstroRemoteDataSource astroRemoteDataSource;
  late AstroRepository astroRepository;
  late GetMoonPhaseImageUseCase getMoonPhaseImageUseCase;
  late MoonPhasePageController controller;
  Position? _currentPosition;

  @override
  void initState() {
    super.initState();
    dio = Dio();
    astroRemoteDataSource = AstroRemoteDataSourceImpl(dio: dio);
    astroRepository =
        AstroRepositoryImpl(astroRemoteDataSource: astroRemoteDataSource);
    getMoonPhaseImageUseCase =
        GetMoonPhaseImageUseCaseImpl(astroRepository: astroRepository);
    controller = MoonPhasePageController(
        getMoonPhaseImageUseCase: getMoonPhaseImageUseCase);
    _getCurrentPosition().then(
      (value) async => controller.getMoonPhaseImage(
        latitude: _currentPosition!.latitude,
        longitude: _currentPosition!.longitude,
        date: DateTime.now().formatDate(true),
      ),
    );
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services'),
        ),
      );
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.'),
        ),
      );
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    controller.value = MoonPhasePageState.loading;
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) {
      return;
    }
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((position) {
      setState(() => _currentPosition = position);
    }).catchError((e) {
      controller.value = MoonPhasePageState.genericError;
      debugPrint(e);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Observador App',
            style: TextStyle(
              fontFamily: AstroConstantFonts.roboto,
            ),
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomFloatActionButton(
              icon: Icons.sunny,
              onClickButton: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CelestialBodyPage(
                      latitude: _currentPosition!.latitude,
                      longitude: _currentPosition!.longitude,
                    ),
                  ),
                );
              },
            ),
            CustomFloatActionButton(
              icon: Icons.star,
              onClickButton: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => StarChartPage(
                      latitude: _currentPosition!.latitude,
                      longitude: _currentPosition!.longitude,
                    ),
                  ),
                );
              },
            ),
            CustomFloatActionButton(
              icon: Icons.favorite,
              onClickButton: () {},
            ),
          ],
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              const Text(
                'Selecione uma data:',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () => DatePicker.showDatePicker(
                  context,
                  onConfirm: (date) async {
                    setState(() => controller.selectedDate = date);
                    await _getCurrentPosition();
                    await controller.getMoonPhaseImage(
                      latitude: _currentPosition!.latitude,
                      longitude: _currentPosition!.longitude,
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
                child: SingleChildScrollView(
                  child: ValueListenableBuilder<MoonPhasePageState>(
                    valueListenable: controller,
                    builder: (context, state, _) {
                      switch (state) {
                        case MoonPhasePageState.loading:
                          return const CircularProgressIndicator();
                        case MoonPhasePageState.authError:
                          return CustomErrorWidget(
                            errorText: 'Ocorreu um erro!',
                            onClickButton: () {},
                            textColor: Colors.black87,
                          );
                        case MoonPhasePageState.genericError:
                          return CustomErrorWidget(
                            errorText: 'Ocorreu um erro!',
                            onClickButton: () {},
                            textColor: Colors.black87,
                          );
                        case MoonPhasePageState.networkError:
                          return CustomErrorWidget(
                            errorText: 'Falha na conexão!',
                            onClickButton: () {},
                            textColor: Colors.black87,
                          );
                        case MoonPhasePageState.success:
                          return Center(
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

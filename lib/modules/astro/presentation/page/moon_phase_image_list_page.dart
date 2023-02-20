import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../generated/l10n.dart';
import '../common/widgets/custom_moon_phase_image_widget.dart';
import '../controller/moon_phase_image_list_page_controller.dart';
import 'moon_phase_image_list_page_state.dart';

class MoonPhaseImageListPage extends StatefulWidget {
  const MoonPhaseImageListPage({Key? key}) : super(key: key);

  @override
  State<MoonPhaseImageListPage> createState() => _MoonPhaseImageListPageState();
}

class _MoonPhaseImageListPageState extends State<MoonPhaseImageListPage> {
  final MoonPhaseImageListPageController controller =
      Modular.get<MoonPhaseImageListPageController>();

  @override
  void initState() {
    super.initState();
    controller.getMoonPhaseImageList();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).moonPhaseImageListPageAppBarTitle),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: ValueListenableBuilder<MoonPhaseImageListPageState>(
            valueListenable: controller,
            builder: (context, state, _) {
              switch (state) {
                case MoonPhaseImageListPageState.loading:
                  return const CircularProgressIndicator();
                case MoonPhaseImageListPageState.emptyList:
                  return Center(
                    child: Text(
                      S.of(context).moonPhaseImageListPageEmpty,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 25),
                    ),
                  );
                case MoonPhaseImageListPageState.success:
                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        controller.imageList.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: CustomMoonPhaseImageWidget(
                              imageUrl:
                                  controller.imageList[index].data.imageUrl,
                              icon: Icons.favorite,
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
              }
            },
          ),
        ),
      );
}

import 'package:flutter/material.dart';
import 'package:observador/api/get_moon_phase.dart';
import 'package:observador/components/centered_message.dart';
import 'package:observador/components/progress.dart';

class MoonPhase extends StatefulWidget {
  DateTime now = DateTime.now();

  @override
  State<MoonPhase> createState() => _MoonPhaseState(getMoonPhase(now));
}

class _MoonPhaseState extends State<MoonPhase> {
  Future<String> moonPhase;
  DateTime now = DateTime.now();

  _MoonPhaseState(this.moonPhase);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moon Phase'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: moonPhase,
          builder: (context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                // TODO: Handle this case.
                break;
              case ConnectionState.waiting:
                return Progress();
              case ConnectionState.active:
                // TODO: Handle this case.
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  String image = snapshot.data;
                  if (image.isNotEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.network(image),
                        ElevatedButton(
                          onPressed: () {
                            showDatePicker(
                                    context: context,
                                    initialDate: now,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2030))
                                .then((value) {
                              setState(() {
                                moonPhase = getMoonPhase(value!);
                              });
                            });
                          },
                          child: Text('Date'),
                        )
                      ],
                    );
                  }
                }
                return CenteredMessage(
                  'No data found',
                  icon: Icons.warning,
                );
                break;
            };
            return CenteredMessage('Unknown error');
          },
        ),
      ),
      );
  }
}

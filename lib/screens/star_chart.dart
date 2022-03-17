import 'package:flutter/material.dart';
import 'package:observador/api/get_all_bodies.dart';
import 'package:observador/api/get_star_chart.dart';
import 'package:observador/components/centered_message.dart';
import 'package:observador/components/progress.dart';

class StarChart extends StatefulWidget {
  @override
  State<StarChart> createState() => _StarChartState();
}

class _StarChartState extends State<StarChart> {
  int group = 0;

  Future<String> starChart = getStarChart("tau");
  TextEditingController filterConttroler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Star Chart')),
      body: FutureBuilder<String>(
        future: starChart,
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
                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Image.network(image),
                          // TextField(
                          //   controller: filterConttroler,
                          //   decoration: InputDecoration(labelText: 'Search'),
                          // ),
                          // ElevatedButton(
                          //   onPressed: () {
                          //     setState(() {
                          //       print(filterConttroler.text);
                          //       starChart = getStarChart(filterConttroler.text);
                          //     });
                          //   },
                          //   child: Text('Search'),
                          // ),
                          Row(
                            children: [
                              Radio(
                                  value: 'and',
                                  groupValue: group,
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      starChart = getStarChart(value.toString());
                                    });
                                  }),
                              Expanded(child: Text('Andromeda'))
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'peg',
                                  groupValue: group,
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      starChart = getStarChart(value.toString());
                                    });
                                  }),
                              Expanded(child: Text('Pegasus'))
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                  value: 'ori',
                                  groupValue: group,
                                  onChanged: (value) {
                                    setState(() {
                                      print(value);
                                      starChart = getStarChart(value.toString());
                                    });
                                  }),
                              Expanded(child: Text('Orion'))
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }
              }
              return CenteredMessage(
                'No data found',
                icon: Icons.warning,
              );
              break;
          }
          ;
          return CenteredMessage('Unknown error');
        },
      ),
    );
  }
}

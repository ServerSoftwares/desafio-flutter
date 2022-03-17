import 'package:flutter/material.dart';
import 'package:observador/api/get_body.dart';
import 'package:observador/components/centered_message.dart';
import 'package:observador/components/progress.dart';
import 'package:observador/model/body.dart';

class Bodies extends StatefulWidget {
  const Bodies({Key? key}) : super(key: key);

  @override
  State<Bodies> createState() => _BodiesState();
}

class _BodiesState extends State<Bodies> {
  TextEditingController filterController = TextEditingController();
  Future<Body> body = getBody('sun');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Body'),
        ),
        body: FutureBuilder<Body>(
          future: body,
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
                  Body celest = snapshot.data;
                  if (celest.data!.table!.rows!.isNotEmpty) {
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  celest.data!.table!.rows!.first.entry!.name
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text('Id: ${celest.data!.table!.rows!.first.cells!.first.id}'),
                                Text('Name: ${celest.data!.table!.rows!.first.cells!.first.name}'),
                                Text('Distance from Earth: ${celest.data!.table!.rows!.first.cells!.first.distance!.fromEarth!.km}KM'),
                                Text('Date: ${celest.data!.table!.rows!.first.cells!.first.date}'),
                              ],
                            ),
                            TextField(
                              controller: filterController,
                              decoration: InputDecoration(labelText: 'Search'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  print(filterController.text);
                                  body = getBody(filterController.text);
                                });
                              },
                              child: Text('Search'),
                            ),
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
      ),
    );
  }
}

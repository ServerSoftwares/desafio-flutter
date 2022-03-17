import 'package:flutter/material.dart';
import 'package:observador/api/get_all_bodies.dart';
import 'package:observador/api/get_body.dart';
import 'package:observador/api/get_moon_phase.dart';
import 'package:observador/api/get_star_chart.dart';
import 'package:observador/screens/bodies.dart';
import 'package:observador/screens/moon_phase.dart';
import 'package:observador/screens/star_chart.dart';

void main() {
  runApp(HomeScreen());
  // getMoonPhase();
  //getStarChart();
  //getAllBodies();
  //getBody();
}

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    MoonPhase(),
    StarChart(),
    Bodies()
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _widgetOptions.elementAt(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dark_mode),
              label: 'Moon Phase',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.auto_awesome),
              label: 'Star Chart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.public),
              label: 'Bodies',
            ),
          ],
          onTap: (index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}


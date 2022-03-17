import 'dart:convert';

import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:observador/api/get_location.dart';
import 'package:observador/api/http.dart';
import 'package:observador/model/star_chart.dart';

Future<String>getStarChart(String constellation) async {

  LocationData currentLocation = await getLocation();

  final now = DateTime.now();
  final time = now.toString().substring(11,19);
  final today = DateTime(now.year, now.month, now.day).toString().substring(0,10);

  Map<String, dynamic> map ={
    "style": "default",
    "observer": {
      "latitude": currentLocation.latitude,
      "longitude": currentLocation.longitude,
      "date": today.toString()
    },
    "view": {
      "type": "constellation",
      "parameters": {
        "constellation": constellation // 3 letter constellation id
      }
    }
  };

  String imageLink = '';

  String jsonString = jsonEncode(map);
  StarChart starChart = StarChart.fromJson(map);

  String url = 'https://api.astronomyapi.com/api/v2/studio/star-chart?observer${starChart.observer}&view=${starChart.view}&style=${starChart.style}';
  Response response = await getResponsePost(url, jsonString);

  print(response.statusCode);
  print(response.body);
  if(response.statusCode == 200){
    var decodedjson = jsonDecode(response.body);
    var imageUrl = decodedjson['data'];
    imageLink = imageUrl['imageUrl'];
    print(imageLink);
    return imageLink;
    }
  return imageLink;
}
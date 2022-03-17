import 'dart:convert';

import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:observador/api/get_location.dart';
import 'package:observador/api/http.dart';
import 'package:observador/model/moon.dart';

Future<String>getMoonPhase(DateTime now)async{

  LocationData currentLocation = await getLocation();

  final time = now.toString().substring(11,19);
  final today = DateTime(now.year, now.month, now.day).toString().substring(0,10);
  final tomorrow = DateTime(now.year, now.month, now.day + 1).toString().substring(0,10);


  Map<String, dynamic> map = {
    "format": "png",
    "style": {
      "moonStyle": "default",
      "backgroundStyle": "solid",
      "backgroundColor": "grey",
      "headingColor": "white",
      "textColor": "white"
    },
    "observer": {
      "latitude": currentLocation.latitude,
      "longitude": currentLocation.longitude,
      "date": today.toString()
    },
    "view": {
      "type": "portrait-simple",
      "orientation": "south-up"
    }
  };

  String jsonString = jsonEncode(map);

  Moon moon = Moon.fromJson(map);
  String imageLink = '';

  String baseUrl = "https://api.astronomyapi.com/api/v2/studio/moon-phase?format=${moon.format}&style${moon.style}&observer=${moon.observer}&view=${moon.view}";
  Response response = await getResponsePost(baseUrl, jsonString);

  if(response.statusCode == 200){
    var decodedjson = jsonDecode(response.body);
    var imageUrl = decodedjson['data'];
    imageLink = imageUrl['imageUrl'];
    print(imageLink);
    return imageLink;

  }
  return imageLink;
}
import 'dart:convert';

import 'package:http/http.dart';
import 'package:location/location.dart';
import 'package:observador/api/get_location.dart';
import 'package:observador/api/http.dart';
import 'package:observador/model/body.dart';

Future<Body> getBody(String celest) async {
  LocationData currentLocation;
  currentLocation = await getLocation();

  print(currentLocation.latitude);
  print(currentLocation.longitude);

  var latitude = currentLocation.latitude;
  var longitude = currentLocation.longitude;
  var elevation = currentLocation.altitude;

  final now = DateTime.now();
  final time = now.toString().substring(11,19);
  final today = DateTime(now.year, now.month, now.day).toString().substring(0,10);
  final yesterday = DateTime(now.year, now.month, now.day - 1).toString().substring(0,10);
  final tomorrow = DateTime(now.year, now.month, now.day + 1).toString().substring(0,10);

  Body body = Body();

  String url = "https://api.astronomyapi.com/api/v2/bodies/positions/${celest}?latitude=${latitude}&longitude=${longitude}&elevation=${elevation}&from_date=${today}&to_date=${tomorrow}&time=${time}";

  Response response = await getResponseGet(url);

  if(response.statusCode == 200){
    var decodedJson = jsonDecode(response.body);
    print("deu certo");
    body = Body.fromJson(decodedJson);
    print(body.data!.table!.rows!.first.cells!.first.name);
    return body;
  }
  return body;
}
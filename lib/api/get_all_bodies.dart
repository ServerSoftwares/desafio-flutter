import 'dart:convert';

import 'package:http/http.dart';
import 'package:observador/api/http.dart';
import 'package:observador/model/bodies.dart';


Future<List<String>?> getAllBodies() async {

  Bodies bodies = Bodies();
  var url = "https://api.astronomyapi.com/api/v2/bodies";

  Response response = await getResponseGet(url);
  print(response.request);

  if(response.statusCode == 200){
    var decodedJson = jsonDecode(response.body);
    bodies = Bodies.fromJson(decodedJson);
    print("deu certo");
    print(bodies.data!.bodies![0]);
    return bodies.data!.bodies;
  }
  return bodies.data!.bodies;
}
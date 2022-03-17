import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

getResponseGet(String url) async {
  final _applicationID = "06d45d45-9fd8-4a4c-815f-a2c387d88fc6";
  final _applicationSecret = "22f07efae8057f1eb54618aac8d1064c867b4757abbd4f542e1ec89814200bde6ce67943d840f20de73e0404fc33efe5ae5043944807b5b499a2ab11ef6eaa7f194a9cdfdb7987d55e01bf75d851810329a77a0bb16a6c28b2b0b7b684508c8ab637c8b24738f7c365e3ddb4b6ef7ccc";

  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_applicationID:$_applicationSecret'));

  var baseUrl = Uri.parse(url);
  Response response = await http.get(baseUrl, headers: <String, String>{'authorization': basicAuth});
  return response;
}

getResponsePost(String url, String jsonString) async {
  final _applicationID = "06d45d45-9fd8-4a4c-815f-a2c387d88fc6";
  final _applicationSecret = "22f07efae8057f1eb54618aac8d1064c867b4757abbd4f542e1ec89814200bde6ce67943d840f20de73e0404fc33efe5ae5043944807b5b499a2ab11ef6eaa7f194a9cdfdb7987d55e01bf75d851810329a77a0bb16a6c28b2b0b7b684508c8ab637c8b24738f7c365e3ddb4b6ef7ccc";

  String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_applicationID:$_applicationSecret'));

  var baseUrl = Uri.parse(url);
  Response response = await http.post(baseUrl, headers: <String, String>{'authorization': basicAuth}, body: jsonString);
  return response;
}
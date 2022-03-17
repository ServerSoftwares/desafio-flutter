import 'package:location/location.dart';

getLocation() async {
  Location location = Location();
  var serviceEnable = await location.serviceEnabled();

  if(!serviceEnable) {
    serviceEnable = await location.requestService();
    if(!serviceEnable){
      return;
    }
  }

  var permissionGranted = await location.hasPermission();
  if(permissionGranted == PermissionStatus.denied){
    permissionGranted = await location.requestPermission();
    if(permissionGranted != PermissionStatus.granted){
      return;
    }
  }

  LocationData currentLocation = await location.getLocation();
  return currentLocation;
}
import 'package:geolocator/geolocator.dart';

mixin VerifyIfLocationPermissionIsEnabledUseCase {
  Future<bool> call();
}

class VerifyIfLocationPermissionIsEnabledUseCaseImpl
    implements VerifyIfLocationPermissionIsEnabledUseCase {
  @override
  Future<bool> call() async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return false;
    }
    return true;
  }
}

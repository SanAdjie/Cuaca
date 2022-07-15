import 'package:geolocator/geolocator.dart';

class LokasiCuaca {

  //Property
  LocationPermission permission;

  double latitude;
  double longitude;

  //Method
  void getPermission() async {
    permission = await Geolocator.requestPermission();
  }

  void getLocationInit() async {
    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      getPermission();
    }
  }
}




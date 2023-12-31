import 'package:geolocator/geolocator.dart';

class Location{
  double ?latitude;
  double ?longitude;

  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location services are disabled.');
    }
    try{
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch(e){
      print(e);
    }
  }
}
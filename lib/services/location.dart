import 'package:geolocator/geolocator.dart';

class Location {
  late double _latitude;
  late double _longitude;

  Future<void> getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.low,
    );
    _latitude = position.latitude;
    _longitude = position.longitude;
  }

  double getLatitude(){
    return _latitude;
  }

  double getLongitude(){
    return _longitude;
  }

}



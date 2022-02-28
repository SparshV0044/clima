import 'dart:async';

import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;
  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();
      StreamSubscription<ServiceStatus> serviceStatusStream =
          Geolocator.getServiceStatusStream().listen((ServiceStatus status) {
        print(status);
      });
      latitude = position.latitude;
      longitude = position.longitude;
      print(longitude);
      print(latitude);
    } catch (e) {
      print(e);
    }
  }
}

import 'dart:async';

import 'package:location/location.dart';

class LocationController {
  Location location = Location();
  StreamController<LocationData> locationStreamController = StreamController();

  LocationController() {
    _start();
  }

  Stream<LocationData> get locationStream => locationStreamController.stream;

  Stream<LocationData> get liveLocationStream => location.onLocationChanged;

  Future<void> _start() async {
    
    bool _isEnabled = await location.serviceEnabled();
    if (!_isEnabled) {
      _isEnabled = await location.requestService();
      if (!_isEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();

      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    LocationData locationData = await location.getLocation();
    locationStreamController.sink.add(locationData);
  }

}
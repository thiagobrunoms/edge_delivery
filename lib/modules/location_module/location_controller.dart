import 'dart:async';

import 'package:location/location.dart';

class LocationPageController {
  Location location = Location();
  StreamController<LocationData> _locationController = StreamController();

  LocationPageController() {
    start();
  }

  Stream<LocationData> get locationStream => _locationController.stream;

  Stream<LocationData> get locationChangingStream => location.onLocationChanged;

  Future<void> start() async {
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();

      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    var locationData = await location.getLocation();
    _locationController.sink.add(locationData);

    // _startListeningToLocationChanges();
  }

  
}
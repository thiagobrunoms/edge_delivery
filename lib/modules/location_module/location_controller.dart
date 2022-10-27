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
    late bool _serviceEnabled;
    late PermissionStatus _permissionGranted;
    late LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();

      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    var locationData = await location.getLocation();
    _locationController.sink.add(locationData);

    // _startListeningToLocationChanges();
  }

  
}
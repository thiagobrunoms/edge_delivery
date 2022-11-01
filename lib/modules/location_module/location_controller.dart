import 'dart:async';
import 'dart:math' as math;
import 'package:dio/dio.dart';
import 'package:location/location.dart';

class LocationController {
  Location location = Location();
  LocationData? previousLocation;
  String? previousAddress;
  StreamController<LocationData> locationStreamController = StreamController.broadcast();

  LocationController() {
    _start();
  }

  Stream<LocationData> get locationStream => locationStreamController.stream;

  Stream<LocationData> get liveLocationStream => location.onLocationChanged;

  // Stream<String> get addressStream => location.onLocationChanged.distinct(isGreaterThanThreshold).asyncMap((event) => loadAddress(event));

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

  Future<String> loadAddress(LocationData locationData) async {
    if (previousLocation != null) {
      var distance = calculateDistance(previousLocation!, locationData);
      print('distancia: $distance');
      if (distance > 10) {
        previousAddress = await _getAddress(locationData);
      }
    } else {
      previousAddress = await _getAddress(locationData);
    }

    previousLocation = locationData;
    
    return previousAddress!;
  }

  Future<String> _getAddress(LocationData locationData) async {
    String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${locationData.latitude},${locationData.longitude}&key=AIzaSyAdlkQTt1WXdCnUi6m6u6KwUkLOSNeOVR4";
    
    Dio dio = Dio();
    var response = await dio.get(url);
    print('0');
    print(((response.data['results'] as List).first['address_components'] as List)[0]);
    print('1');
    print(((response.data['results'] as List).first['address_components'] as List)[1]['long_name']);
    print('2');
    print(((response.data['results'] as List).first['address_components'] as List)[2]);
    return ((response.data['results'] as List).first['address_components'] as List)[1]['long_name'];
  }

  bool isGreaterThanThreshold(LocationData location1, LocationData location2) {
    print('calling greater');
    double distance = calculateDistance(location1, location2);
    print('distance ${distance}');
    if (distance > 10) {
      return true;
    } else {
      return false;
    }
  }

  double calculateDistance(LocationData location1, LocationData location2) {
    double lat1 = location1.latitude!;
    double lon1 = location1.longitude!;
    double lat2 = location2.latitude!;
    double lon2 = location2.longitude!;

    var earthRadiusKm = 6371;

    var dLat = convertDegreesToRadians(lat2 - lat1);
    var dLon = convertDegreesToRadians(lon2 - lon1);

    lat1 = convertDegreesToRadians(lat1);
    lat2 = convertDegreesToRadians(lat2);

    var a = math.sin(dLat / 2) * math.sin(dLat / 2) + math.sin(dLon / 2) * math.sin(dLon / 2) * math.cos(lat1) * math.cos(lat2);
    var c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    double distance = (earthRadiusKm * c) * 1000;
    print('DISTANCIA: $distance');
    return distance; //meters
  }

  double convertDegreesToRadians(double degrees) {
    return degrees * (math.pi / 180);
  }

}
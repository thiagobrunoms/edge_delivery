import 'package:edge_delivery/modules/location_module/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationPageController controller = LocationPageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: controller.locationStream,
              builder: onLocationCallback
            ),
            StreamBuilder(
              stream: controller.locationChangingStream,
              builder: onLocationCallback
            )
          ],
        ),
      )
    );
  }

  Widget onLocationCallback(BuildContext context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
      return const CircularProgressIndicator();
    }

    LocationData location = snapshot.data!;
    return Text('Lat: ${location.latitude}, Long: ${location.longitude}');
  }
}
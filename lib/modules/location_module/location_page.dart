import 'package:edge_delivery/modules/location_module/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationController controller = LocationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<LocationData>(
        stream: controller.liveLocationStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            LocationData locationData = snapshot.data!;

            return Center(
              child: Container(
                child: Text('lat: ${locationData.latitude}, long: ${locationData.longitude}', style: TextStyle(fontSize: 20),),));
          }
          
          return Center(child: Text('Buscando localização!'),);
        }
      ),
    );
  }
}
import 'dart:async';

import 'package:edge_delivery/modules/location_module/location_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:ui' as ui;

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationController controller = LocationController();
  Set<Marker> markers = <Marker>{};
  late Completer<GoogleMapController> completer;

  @override
  void initState() {
    super.initState();

    completer = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<LocationData>(
        stream: controller.liveLocationStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('ATUALIZANDO ${snapshot.data}');
            LocationData locationData = snapshot.data!;

            LatLng locationLatLng = LatLng(locationData.latitude!, locationData.longitude!);
            CameraPosition cameraPosition = CameraPosition(
              target: locationLatLng,
              zoom: 14
            );

            return FutureBuilder<String>(
              future: controller.loadAddress(locationData),
              builder: (context, snapshotAddress) {
                String address = snapshotAddress.hasData ? snapshotAddress.data! : "Loading...";

                setMarkerOnCurrentPosition(locationLatLng, address);
                goTo(locationLatLng);

                return GoogleMap(
                  initialCameraPosition: cameraPosition,
                  onMapCreated: (GoogleMapController controller) {
                    completer.complete(controller);
                  },
                  markers: markers,
                );
              }
            );
          }
          
          return const Center(child: Text('Buscando localização!'),);
        }
      ),
    );
  }

  Future<void> setMarkerOnCurrentPosition(LatLng locationLatLng, String address) async {
    Marker marker = Marker(
      markerId: MarkerId(locationLatLng.hashCode.toString()),
      position: locationLatLng,
      icon: BitmapDescriptor.fromBytes(await getCarByteData()),
      draggable: true,
      infoWindow: InfoWindow(
        title: address
      )
    );

    markers.clear();
    markers.add(marker);
  }

  Future<void> goTo(LatLng locationLatLng) async {
    GoogleMapController googleMapController = await completer.future;
    CameraPosition cameraPosition = CameraPosition(target: locationLatLng, zoom: 14);
    googleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<Uint8List> getCarByteData() async{
    ByteData data = await rootBundle.load('assets/images/car.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: 100);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  }
}
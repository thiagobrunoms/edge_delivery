import 'dart:async';

import 'package:edge_delivery/modules/location_module/location_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:ui' as ui;

class GoogleMapsViewPage extends StatefulWidget {
  const GoogleMapsViewPage({super.key});

  @override
  State<GoogleMapsViewPage> createState() => _GoogleMapsViewPageState();
}

class _GoogleMapsViewPageState extends State<GoogleMapsViewPage> {
  LocationController locationController = LocationController();

  late Completer<GoogleMapController> _controller;
  Marker marker = Marker(markerId: MarkerId('0'));
  Set<Marker> markers = <Marker>{};

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
    
    _controller = Completer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Uint8List>(
        future: getCarByteData(),
        builder: (context, snapshotCar) {
          if (!snapshotCar.hasData) {
            return const CircularProgressIndicator();
          }

          return StreamBuilder<LocationData>(
            stream: locationController.liveLocationStream,
            builder: (context, snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                CameraPosition position = CameraPosition(
                  target: LatLng(snapshot.data!.latitude!, snapshot.data!.longitude!),
                  zoom: 14.4746,
                );

                setMarkOnCurrentLocation(snapshot.data!, snapshotCar.data!);
                _goTo(position);

                return GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: position,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  markers: markers,
                  onLongPress: (latlng) {
                    print('Latlng $latlng');
            
                    setState(() {
                      markers.remove(marker);
                      marker = Marker(
                        draggable: true,
                        position: latlng, 
                        infoWindow: const InfoWindow(
                          title: 'Você está aqui!',
                        ),
                        markerId: MarkerId(latlng.hashCode.toString()),
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${latlng.latitude}, ${latlng.longitude}')));
                        },
                        onDragEnd: (latlng) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Moved to ${latlng.latitude}, ${latlng.longitude}')));
                        }
                      );
                      markers.add(marker);
                    });
                    
                  },
                );
              }
              
              return Center(child: CircularProgressIndicator());
            }
          );
        }
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  void setMarkOnCurrentLocation(LocationData locationData, Uint8List image) {
    LatLng location = LatLng(locationData.latitude!, locationData.longitude!);
    markers.remove(marker);

      marker = Marker(
        draggable: true,
        position: location,
        icon: BitmapDescriptor.fromBytes(image),
        infoWindow: const InfoWindow(
          title: 'Você está aqui!',
        ),
        markerId: MarkerId(location.hashCode.toString()),
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${location.latitude}, ${location.longitude}')));
        },
        onDragEnd: (latlng) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Moved to ${latlng.latitude}, ${latlng.longitude}')));
        }
      );

      markers.add(marker);
  }

  Future<void> _goTo(CameraPosition cameraPosition) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  Future<Uint8List> getCarByteData() async{
    ByteData data = await rootBundle.load('assets/images/car.png');
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(), targetHeight: 100);
    ui.FrameInfo fi = await codec.getNextFrame();
    return(await fi.image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
  
  }
}
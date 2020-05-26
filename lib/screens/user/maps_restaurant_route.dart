import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'package:maps_launcher/maps_launcher.dart';

class RestaurantRoute extends StatefulWidget {
  @override
  State<RestaurantRoute> createState() => MapSampleState();
}

class MapSampleState extends State<RestaurantRoute> {
  static const String id = 'restaurants_route';
  Completer<GoogleMapController> _controller = Completer();
  final Map<String, Marker> _markers = {};

  // Test position Amsterdam
  // TODO: get user location data
  static final CameraPosition AMSTERDAMTEST =
      CameraPosition(target: LatLng(52.379189, 4.899431), zoom: 12.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: AMSTERDAMTEST,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {testMarkerHvA, testMarkerWoost}, // TODO: figure out marker data from backend
      ), 
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _getLocation,
      //   child: Icon(Icons.flag),
      // ),
    );
  }




  Marker testMarkerHvA = Marker(
      markerId: MarkerId("testMarkerHvA"),
      position: LatLng(52.359083, 4.909412),
      infoWindow: InfoWindow(title: "HvA Wibauthuis"),
      onTap: () => MapsLauncher.launchQuery(
                    'Wibautstraat 3b 1091 GH Amsterdam'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure));

  Marker testMarkerWoost = Marker(
      markerId: MarkerId("testMarkerWoost"),
      position: LatLng(52.370965, 4.932121),
      infoWindow: InfoWindow(title: "Woost Tech"),
      onTap: () => MapsLauncher.launchQuery(
                    'Frans de Wollantstraat 82, 1018 SC Amsterdam'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure));

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}

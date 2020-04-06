import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RestaurantRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(52.3702157, 4.8951679), zoom: 12),
        )
      ]),
    );
  }
}

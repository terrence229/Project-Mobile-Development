import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:woosttogo/screens/user/maps_restaurant_route.dart';
import 'package:woosttogo/screens/shopping/restaurant_list_route.dart';


class MapRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MapPage();
  }
}

class MapPage extends StatefulWidget{
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<MapPage> {
  //GoogleMapController mapController;
  Completer<GoogleMapController> mapController = Completer();
  String searchAddr;

  @override
  Widget build(BuildContext context) {
    //SearchMapPlaceWidget();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,

            title: Text("Maps"),

            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.restaurant,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/restaurantlist');
                },
              ),
            ],
          ),
        body: Center(
            child: Stack(
                children: <Widget>[
                  //displaying of the map
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: GoogleMap(

                      initialCameraPosition: CameraPosition(
                          target: LatLng(52.3702157, 4.8951679),
                          zoom: 12
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        mapController.complete(controller);
                      },
                      markers: {testMarkerHvA, testMarkerWoost},
                    ),

                  ),
                  //displaying of the searchbar
                  Positioned(
                    top: 30.0,
                    right: 15.0,
                    left: 15.0,
                    child: Container(
                      height: 50.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: 'Enter Address',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 15.0, top: 15.0),
                            suffixIcon: IconButton(
                                icon: Icon(Icons.search),
                                onPressed: searchandNavigate,
                                iconSize: 30.0)),
                        onChanged: (val) {
                          setState(() {
                            searchAddr = val;
                          });
                        },
                      ),
                    ),
                  ),
                ]
            )

        )
    );


  }

  Future<void> searchandNavigate()  {
    //finds the coordinates from the place the user is searching for and redirects them in a smooth way
    Geolocator().placemarkFromAddress(searchAddr).then((result) async{
      final GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
          LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 10.0)));
    });
  }
//gives the controller to the mapcontroller
  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
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
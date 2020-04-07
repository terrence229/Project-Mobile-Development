import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:search_map_place/search_map_place.dart';

void main() => runApp(MapRoute());
    class MapRoute extends StatelessWidget{
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        );
      }
      }

    class MyHomePage extends StatefulWidget{
      @override
      _MyHomePageState createState() => _MyHomePageState();

    }

    /*
class _MyHomePageState extends State<MyHomePage> {
  GoogleMapController mapController;

  String searchAddr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: onMapCreated,
              options: GoogleMapOptions(
                  cameraPosition: CameraPosition(
                      target: LatLng(40.7128, -74.0060), zoom: 10.0)),
            ),
            Positioned(
              top: 30.0,
              right: 15.0,
              left: 15.0,
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0), color: Colors.white),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Enter Address',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
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
            )
          ],
        ));
  }

  searchandNavigate() {
    Geolocator().placemarkFromAddress(searchAddr).then((result) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
          LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 10.0)));
    });
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
*/



class _MyHomePageState extends State<MyHomePage> {
  //GoogleMapController mapController;
  Completer<GoogleMapController> mapController = Completer();
  String searchAddr;

  @override
  Widget build(BuildContext context) {
    //SearchMapPlaceWidget();
    return Scaffold(
        appBar: AppBar(
          title: Text('Maps'),
        ),
        body: Center(
            child: Stack(
                children: <Widget>[
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
                    ),
                  ),
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
                  )
                ]
            )
        )
    );
  }

  Future<void> searchandNavigate()  {
    Geolocator().placemarkFromAddress(searchAddr).then((result) async{
      final GoogleMapController controller = await mapController.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target:
          LatLng(result[0].position.latitude, result[0].position.longitude),
          zoom: 10.0)));
      debugPrint("werkt");
    });
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }
}
/*
Widget build(BuildContext context) {
  return Scaffold(
      body: Center(

          child: SearchMapPlaceWidget(
              apiKey: "AIzaSyC8ISZ3VvCWWo0yQquwdGHMSXKlDVeYn8Q"

          )
      )
  );
}


class Searchbar extends State<MyHomePage>{
_//searchBarState createState() => _SearchbarState();
}
 */








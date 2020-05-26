
import 'package:flutter/material.dart';

/// Datalist component used to show and format restaurants and menus
class DataList extends StatelessWidget {
  DataList({this.restaurant, this.location, this.hours, this.menu});

  final String restaurant;
  final String location;
  final String hours;
  final Map<String, dynamic> menu;



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(restaurant),
          Text(location),
          Text(hours),
          Text(menu.toString())
        ],
      ),

    );
  }

}
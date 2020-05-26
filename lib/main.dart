import 'package:flutter/material.dart';
import 'package:woosttogo/screens/admin/add_data_route.dart';
import 'package:woosttogo/screens/shopping/restaurant_list_route.dart';
import 'package:woosttogo/screens/shopping/menu_list_route.dart';

import 'package:woosttogo/screens/shopping/cart_route.dart';
import 'package:woosttogo/screens/shopping/quantity_route.dart';

import 'screens/start/login_route.dart';
import 'screens/start/register_route.dart';

import 'screens/landing_route.dart';



import 'screens/user/maps_restaurant_route.dart';

// Startingpoint of app, do not touch!
void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.yellow,
        accentColor: Colors.purple,
      ),
      home: LandingRoute(),
      routes: {
        "/register": (context) => RegisterRoute(),
        "/login": (context) => LoginRoute(),
        "/map": (context) => RestaurantRoute(),
        "/restaurantlist": (context) => RestaurantListRoute(),
        "/cart": (context) => CartRoute(),
        "/itemoverview": (context) => ItemOverviewRoute(),
        "/itemmenu": (context) => ShowMenuRoute(),
        "/admin": (context) => AddDataRoute(), // admin / testing
      },
    );
  }
}

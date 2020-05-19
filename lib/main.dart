import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:woosttogo/screens/admin/add_data_route.dart';
import 'package:woosttogo/screens/admin/show_list_route.dart';
import 'package:woosttogo/screens/admin/show_menu_route.dart';
import 'package:woosttogo/screens/user/Restaurant_List_Route.dart';
import 'dart:convert';

import 'screens/start/login_route.dart';
import 'screens/start/register_route.dart';

import 'screens/landing_route.dart';
import 'screens/user/item_menu_route.dart';
import 'screens/user/item_overview_route.dart';

import 'screens/user/order_route.dart';

import 'screens/user/restaurants_route.dart';

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
        "/itemmenu": (context) => ItemMenu(),
        "/adminlist": (context) => ListRoute(), // admin / testing
        "/admin": (context) => AddDataRoute(), // admin / testing
        '/adminmenuview': (context) => ShowMenuRoute(), // admin / testing
      },
    );
  }
}

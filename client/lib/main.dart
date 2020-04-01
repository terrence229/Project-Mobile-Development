import 'package:flutter/material.dart';
import 'screens/landing_route.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


// Startingpoint of app, do not touch!
void main() => runApp(MainApp());

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      home: LandingRoute(),
    );
  }
}

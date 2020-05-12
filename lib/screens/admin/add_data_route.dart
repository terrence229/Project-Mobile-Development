import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:woosttogo/components/navigator_button.dart';

class AddDataRoute extends StatefulWidget {
  @override
  _AddDataRouteState createState() => _AddDataRouteState();
}

class _AddDataRouteState extends State<AddDataRoute> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInuser;

  String restaurantName;
  String openingHours;
  String menu; // Placeholder

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Restaurant name',
              ),
              onChanged: (value) {
                restaurantName = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Opening hours (e.g. "07:00 - 23:00")',
              ),
              onChanged: (value) {
                openingHours = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Menu',
              ),
              onChanged: (value) {
                menu = value;
              },
            ),
            SizedBox(height: 100), // Spacer between input and button
            NavigatorButton(
              buttonTitle: "Add to database",
              onPressed: () async {

                // Firestore expects a map of the data!
                _firestore.collection("restaurants").add({
                  'name': restaurantName,
                  'hours': openingHours,
                  'menu': menu
                });
                try {
                  print("Hello, World!");
                } catch (e) {
                  print(e);
                }
              },
            ),
            SizedBox(height: 20),
            NavigatorButton(
              buttonTitle: "Show list",
              onPressed: () async {
                Navigator.pushNamed(context, "/adminlist");
              },
            ),
          ],
        ),
      ),
    );
  }
}

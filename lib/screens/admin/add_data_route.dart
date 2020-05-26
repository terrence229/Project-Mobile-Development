import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDataRoute extends StatefulWidget {
  @override
  _AddDataRouteState createState() => _AddDataRouteState();
}

class _AddDataRouteState extends State<AddDataRoute> {
  final _firestore = Firestore.instance;
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInuser;

  String restaurantName;
  String restaurantLocation;
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
                labelText: 'Location',
              ),
              onChanged: (value) {
                restaurantLocation = value;
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
            SizedBox(height: 50), // Spacer between input and button
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                FlatButton(
                  color: Colors.yellow,
                  onPressed: () async {
                    try {
                      // Firestore expects a map of the data!
                      _firestore.collection("restaurants").add({
                        'name': restaurantName,
                        'location': restaurantLocation,
                        'hours': openingHours,
                        'menu': menu
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text(
                    "Add to DB",
                  ),
                ),
                SizedBox(width: 50),
                FlatButton(
                  color: Colors.yellow,
                  onPressed: () async {

                  },
                  child: Text(
                    "Menus",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            FlatButton(
              color: Colors.yellow,
              onPressed: () async {
                Navigator.pushNamed(context, "/adminlist");
              },
              child: Text(
                "Show List"
              ),
            ),
          ],
        ),
      ),
    );
  }
}

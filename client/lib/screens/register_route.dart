import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

class RegisterRoute extends StatefulWidget {
	@override
	_RegisterRouteState createState() => _RegisterRouteState();
}

//TODO: make secure & add validation
String nameText;
String passwordText;

/// Register Page
class _RegisterRouteState extends State<RegisterRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
							onChanged: (text) {
								nameText = text;
							},
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
							onChanged: (password) {
								passwordText = password;
							},
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Repeat password',
              ),
            ),
            SizedBox(height: 500), // Spacer between input and button
            MaterialButton(
              minWidth: 300.0, // Hardcoded size, fix later!
              color: Colors.black,
              shape: RoundedRectangleBorder(
                // Make button rounded
                borderRadius: new BorderRadius.circular(50.0),
              ),
              onPressed: () {
                registerPost();
              },
              child: Text(
                // Button text
                'Register',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/// Posts register values to backend
registerPost() async {
  // r = response object
	print("VALUE: $nameText");
  var r = await Requests.post(
		"http://localhost:1337/register",
     body: { // placeholder values
      	"name": "$nameText",
				"password": "$passwordText"
     },

     bodyEncoding: RequestBodyEncoding.JSON); // format to send
  r.raiseForStatus();
}

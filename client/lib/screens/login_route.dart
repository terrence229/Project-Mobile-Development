import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:requests/requests.dart';

class LoginRoute extends StatefulWidget {
	@override
	_LoginRouteState createState() => _LoginRouteState();
}

//TODO: make secure & add validation
String nameText;
String passwordText;

/// Register Page
class _LoginRouteState extends State<LoginRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Route"),
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
            SizedBox(height: 500), // Spacer between input and button
            MaterialButton(
              minWidth: 300.0, // Hardcoded size, fix later!
              color: Colors.black,
              shape: RoundedRectangleBorder(
                // Make button rounded
                borderRadius: new BorderRadius.circular(50.0),
              ),
              onPressed: () {
                loginPost();
              },
              child: Text(
                // Button text
                'Login',
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
loginPost() async {
  // r = response object
	print("VALUE: $nameText");
  var r = await Requests.post(
		"http://localhost:1337/login",
     body: { // placeholder values
      	"name": "$nameText",
				"password": "$passwordText"
     },

     bodyEncoding: RequestBodyEncoding.JSON); // format to send
  r.raiseForStatus();
}

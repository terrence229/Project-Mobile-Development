import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'package:woosttogo/components/navigator_button.dart';
import 'package:woosttogo/services/networking.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

//TODO: make secure & add validation
String emailText;
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
              onChanged: (email) {
                emailText = email;
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
            SizedBox(height: 100), // Spacer between input and button
            NavigatorButton(
              buttonTitle: "Login",
              onPressed: () {
               NetworkHelper().loginPost(emailText, passwordText); 
              },
            ),
          ],
        ),
      ),
    );
  }
}

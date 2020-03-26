import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:requests/requests.dart';
import 'package:woosttogo/components/navigator_button.dart';
import 'package:woosttogo/services/networking.dart';

class RegisterRoute extends StatefulWidget {
  @override
  _RegisterRouteState createState() => _RegisterRouteState();
}

//TODO: make secure & add client-side validation
String nameText;
String emailText;
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
                labelText: 'Name',
              ),
              onChanged: (text) {
                nameText = text;
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'E-mail',
              ),
              onChanged: (email) {
                emailText = email;
              },
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'password',
              ),
              onChanged: (password) {
                passwordText = password;
              },
            ),
            SizedBox(height: 100), // Spacer between input and button
            NavigatorButton(
                onPressed: () {
                  print(nameText);
                  setState(
                    () {
                      NetworkHelper()
                          .registerPost(nameText, emailText, passwordText);
                    },
                  );
                },
                buttonTitle: "Register"),
          ],
        ),
      ),
    );
  }
}

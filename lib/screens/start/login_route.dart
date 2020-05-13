import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:woosttogo/screens/admin/add_data_route.dart';
import 'package:woosttogo/components/navigator_button.dart';
import 'package:woosttogo/services/networking.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRoute extends StatefulWidget {
  @override
  _LoginRouteState createState() => _LoginRouteState();
}

class _LoginRouteState extends State<LoginRoute> {
  final _auth = FirebaseAuth.instance; // Used to authenticate user

  String emailText;
  String passwordText;

  final storage = FlutterSecureStorage(); // TODO: move to networking tool
  FirebaseUser loggedInUser;

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
              onPressed: () async {
                try {
                  final loginUser = await _auth.signInWithEmailAndPassword(
                      email: emailText, password: passwordText);

                  // Print email if user is logged in
                  if (loginUser != null) {
                    print(loginUser.user.email);
                    if (loginUser.user.email == "admin@admin.nl") {
                      Navigator.pushNamed(context, "/admin");
                    }
                  }
                } catch (e) {
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

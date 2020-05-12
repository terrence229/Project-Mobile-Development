import 'package:flutter/material.dart';
import 'package:woosttogo/components/navigator_button.dart';
import 'package:woosttogo/services/networking.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterRoute extends StatelessWidget {

  
  //TODO: make secure & add client-side validation
  String nameText;
  String emailText;
  String passwordText;

  final _auth = FirebaseAuth.instance; // Used to authenticate user

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
                onPressed: () async {
                  try {
                    final newUser = _auth.createUserWithEmailAndPassword(
                        email: emailText, password: passwordText);
                    if (newUser != null) {
                      Navigator.pushNamed(context, '/map');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                buttonTitle: "Register"),
          ],
        ),
      ),
    );
  }
}

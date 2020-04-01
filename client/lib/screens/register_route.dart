import 'package:flutter/material.dart';
import 'package:woosttogo/components/navigator_button.dart';
import 'package:woosttogo/services/networking.dart';
import 'package:woosttogo/screens/login_route.dart';

class RegisterRoute extends StatelessWidget {
//TODO: make secure & add client-side validation
  String nameText;
  String emailText;
  String passwordText;

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
                onPressed: () {
                  print(nameText);
                  NetworkHelper().registerPost(emailText, passwordText);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginRoute();
                  }));
                },
                buttonTitle: "Register"),
          ],
        ),
      ),
    );
  }
}

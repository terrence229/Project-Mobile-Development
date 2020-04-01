import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:woosttogo/components/navigator_button.dart';
import 'package:woosttogo/services/networking.dart';
import 'item_menu_route.dart';

class LoginRoute extends StatelessWidget {
  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    if (jwt == null) return "";
    return jwt;
  }

  String emailText;
  String passwordText;

  final storage = FlutterSecureStorage(); // TODO: move to networking tool

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
                var jwt =
                    await NetworkHelper().loginPost(emailText, passwordText);
                if (jwt != null) {
                  storage.write(key: "jwt", value: jwt);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ItemMenu();
                  }));
                  // TODO: pass JWT to next page
                  // builder: (context) => NextPage.fromBase64(jwt)));
                } else {
                  print('jwt is null (wrong credentials)');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

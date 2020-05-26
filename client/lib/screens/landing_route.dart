import 'package:flutter/material.dart';
import 'package:woosttogo/components/navigator_button.dart';
import 'package:woosttogo/screens/restaurants_route.dart';
import 'register_route.dart';
import 'login_route.dart';
import 'item_menu_route.dart';

/// Splash screen
/// This page only displays the title and buttons:w
class LandingRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE500), // FFE500 = woost color
      // SafeArea puts widgets clear of system icons
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "To Go", // Title text
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    fontSize: 56.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100), // Spacer
            NavigatorButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RestaurantRoute(); // Display new route
                      // return ItemMenu(); // Display new route
                    },
                  ),
                );
              },
              buttonTitle: "Map",
            ),
                        SizedBox(height: 100), // Spacer
            NavigatorButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      // return RestaurantRoute(); // Display new route
                      return ItemMenu(); // Display new route
                    },
                  ),
                );
              },
              buttonTitle: "Quick Order",
            ),
            SizedBox(height: 20), // Spacer
            NavigatorButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginRoute(); // Display new route
                    },
                  ),
                );
              },
              buttonTitle: "Login",
            ),
            SizedBox(height: 20),
            NavigatorButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegisterRoute(); // Display new route
                    },
                  ),
                );
              },
              buttonTitle: "Register",
            ),
          ],
        ),
      ),
    );
  }
}


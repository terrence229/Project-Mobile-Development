import 'package:flutter/material.dart';
import 'package:woosttogo/components/navigator_button.dart';

import 'start/register_route.dart';
import 'user/item_menu_route.dart';

/**
 * Splash screen
 * This page only displays the title and buttons
 */
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
                Navigator.pushNamed(context, '/map');
              },
              buttonTitle: "Map",
            ),
            SizedBox(height: 100), // Spacer
            NavigatorButton(
              onPressed: () {
                Navigator.pushNamed(context, '/restaurantlist');
              },
              buttonTitle: "Quick Order",
            ),
            SizedBox(height: 20), // Spacer
            NavigatorButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              buttonTitle: "Login",
            ),
            SizedBox(height: 20),
            NavigatorButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              buttonTitle: "Register",
            ),
          ],
        ),
      ),
    );
  }
}

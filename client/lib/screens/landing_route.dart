import 'package:flutter/material.dart';
import 'register_route.dart';
import 'login_route.dart';
import 'item_menu_route.dart';

/**
 * Splash screen
 * This page only displays the title and buttons:w
 * TODO: Add login & register buttons when work on backend startsT
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
            SizedBox(height: 500), // Spacer between title & button,
            MaterialButton(
              minWidth: 300.0, // Hardcoded size, fix later!
              color: Colors.black,
              shape: RoundedRectangleBorder(
                // Make button rounded
                borderRadius: new BorderRadius.circular(50.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ItemMenu(); // Display new route
                    },
                  ),
                );
              },
              child: Text(
                // Button text
                'Quick Order',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              minWidth: 300.0, // Hardcoded size, fix later!
              color: Colors.black,
              shape: RoundedRectangleBorder(
                // Make button rounded
                borderRadius: new BorderRadius.circular(50.0),
              ),
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
              child: Text(
                // Button text
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              minWidth: 300.0, // Hardcoded size, fix later!
              color: Colors.black,
              shape: RoundedRectangleBorder(
                // Make button rounded
                borderRadius: new BorderRadius.circular(50.0),
              ),
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
import 'package:flutter/material.dart';
import 'package:woosttogo/components/navigator_button.dart';

/// Splash screen
/// This page only displays the title and buttons
class LandingRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFE500), // FFE500 = woost color
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 200),
                    child: Text(
                      "To Go", // Title text
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 56.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 1.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    minWidth: 300,
                    color: Colors.yellow,
                    elevation: 5,
                    onPressed: () {
                      Navigator.pushNamed(context, '/restaurantlist');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Quick Order'),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                margin: EdgeInsets.only(bottom: 5.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    minWidth: 300,
                    color: Colors.yellow,
                    elevation: 5,
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Login'),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    minWidth: 300,
                    color: Colors.yellow,
                    elevation: 5,
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text('Register'),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

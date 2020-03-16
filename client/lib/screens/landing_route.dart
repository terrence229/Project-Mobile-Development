import 'package:flutter/material.dart';
import 'order_route.dart';

/**
 * Splash screen
 * TODO: add login & register buttons
 */
class LandingRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return OrderRoute();
                },
              ),
            );
          },
          child: Text('Order'),
        ),
      ),
    );
  }
}

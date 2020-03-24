import 'package:flutter/material.dart';
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
                  return ItemMenu();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

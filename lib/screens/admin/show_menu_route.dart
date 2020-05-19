import 'dart:convert';

import 'package:flutter/material.dart';

class ShowMenuRoute extends StatelessWidget {
  final Map<String, dynamic> menu;
  ShowMenuRoute({Key key, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gets menu from previous route.
    final Map<String, dynamic> menu = ModalRoute.of(context).settings.arguments;

    void testRun() {

      print(menu.values.elementAt(0)); // Prints drinks
      print(menu.values.elementAt(1)); // Prints food
    }

    testRun();
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Route > Menu"),
      ),
      body: Center(
        child: Text('$menu'),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        elevation: 5.0,
        color: Colors.yellow,
        child: MaterialButton(
          onPressed: () => {print("Hello, World!")},
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Column(
              children: <Widget>[],
            ),
          ),
        ),
      ),
    );
  }
}

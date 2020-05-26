import 'package:flutter/material.dart';

/// Order page
/// TODO: add list with dummy restaurants
class OrderRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: Container(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// Cart page
class CartRoute extends StatefulWidget {
  @override
  _CartRouteState createState() => _CartRouteState();
}

class _CartRouteState extends State<CartRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Center(
        child: Container(
          child: Text('Hello, World!'),
        ),
      ),
    );
  }
}

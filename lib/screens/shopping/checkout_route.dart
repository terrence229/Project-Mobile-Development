import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woosttogo/components/rainbow_text.dart';
import 'package:woosttogo/models/cart.dart';

class CheckoutRoute extends StatefulWidget {
  @override
  _CheckoutRouteState createState() => _CheckoutRouteState();
}

class _CheckoutRouteState extends State<CheckoutRoute> {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context, listen: false);
    final double toPay = cart.totalPrice;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: RainbowText(colors: [
          Color(0xFFFF2B22),
          Color(0xFFFF7F22),
          Color(0xFFEDFF22),
          Color(0xFF22FF22),
          Color(0xFF22F4FF),
          Color(0xFF5400F7),
        ], text: "FEED US MONEY", loop: true),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RainbowText(colors: [
          Color(0xFFFF2B22),
          Color(0xFFFF7F22),
          Color(0xFFEDFF22),
          Color(0xFF22FF22),
          Color(0xFF22F4FF),
          Color(0xFF5400F7),
        ], text: "€$toPay", loop: true),
      
          ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:woosttogo/models/cart.dart';
import 'package:woosttogo/screens/shopping/payment_route.dart';

class CheckoutRoute extends StatefulWidget {
  @override
  _CheckoutRouteState createState() => _CheckoutRouteState();
}

// TODO: add where to ship fields
class _CheckoutRouteState extends State<CheckoutRoute> {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context, listen: false);
    final double toPay = cart.totalPrice;

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Bestellen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Consumer<Cart>(
              builder: (context, cart, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return Material(
                        child: Text(
                            '€${item.price} voor ${item.quantity} ${item.name}'));
                  },
                  itemCount: cart.itemCount,
                );
              },
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 50.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    color: Colors.yellow,
                    elevation: 5,
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: PaymentRoute(),
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 42.0),
                      child: Text('Bestellen: €${cart.totalPrice}'),
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


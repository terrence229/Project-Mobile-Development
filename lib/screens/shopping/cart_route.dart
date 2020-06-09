import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woosttogo/models/cart.dart';
import 'package:woosttogo/components/item_tile.dart';
import 'package:woosttogo/screens/shopping/payment_route.dart';
import 'package:woosttogo/utilities/order.dart';

class CartRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        // title: Text("List View Route > Menu"),
        title: Text('Cart'), // TODO: display username
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<Cart>(
              builder: (context, cart, child) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final item = cart.items[index];
                    return ItemTile(
                      item: item,
                    );
                  },
                  itemCount: cart.itemCount,
                );
              },
            ),
            MaterialButton(
              color: Color(0xFFFFE500),
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
                child: Text('Bestellen: €${cart.totalPrice}', textScaleFactor: 1.25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

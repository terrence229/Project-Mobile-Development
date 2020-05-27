import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woosttogo/models/cart.dart';
import 'package:woosttogo/components/item_tile.dart';

class CartRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("List View Route > Menu"),
        title: Text('Cart'), // TODO: display username
        actions: <Widget>[
          // TODO: make fancy button instead of icon
          IconButton(
            icon: Icon(
              Icons.payment,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/checkout");
            },
          )
        ],
      ),
      body: Center(
        child: Consumer<Cart>(
          builder: (context, cart, child) {
            return ListView.builder(
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
      ),
    );
  }
}

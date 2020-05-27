import 'package:flutter/material.dart';

/// Displays the items in the cart
class ItemTile extends StatelessWidget {
  final String name;
  final double price;

  ItemTile({
    this.name,
    this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$name €$price',
      ),
    );
  }
}

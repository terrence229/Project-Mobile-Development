import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woosttogo/models/cart.dart';
import 'package:woosttogo/models/item.dart';

/// Displays the items in the cart
class ItemTile extends StatefulWidget {
  final Item item;

  ItemTile({
    this.item,
  });

  @override
  _ItemTileState createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    // Cart provider used to interact with cart model.
    final Cart cart = Provider.of<Cart>(context, listen: false);
    final String name = widget.item.name;
    final double price = widget.item.price;

    int quantity = cart.itemQuantity(widget.item);

    final double itemPrice =
        cart.itemPrice(widget.item);

    return ListTile(
      title: Text(
        '$name',
      ),
      subtitle: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.remove_circle),
            onPressed: () {
              setState(
                () {
                  quantity > 1
                      ? cart.removeQuantity(widget.item)
                      : cart.deleteItem(widget.item);
                },
              );
            },
          ),
          Text(quantity.toString()),
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {
              setState(
                () {
                  cart.addQuantity(widget.item);
                },
              );
            },
          )
        ],
      ),
      trailing: Container(
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(text: '€$itemPrice'),
            ],
          ),
        ),
      ),
    );
  }
}

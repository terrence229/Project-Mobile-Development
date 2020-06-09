import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:woosttogo/models/cart.dart';
import 'package:woosttogo/models/item.dart';

class ShowMenuRoute extends StatelessWidget {
  final Map<String, dynamic> menu;
  ShowMenuRoute({Key key, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gets menu from previous route.
    final Map<String, dynamic> menu = ModalRoute.of(context).settings.arguments;
        final Cart cart = Provider.of<Cart>(context, listen: false);
        
    Map<String, dynamic> completeMenu = {};
    completeMenu.addAll(menu['food']);
    completeMenu.addAll(menu['drinks']);

    return Scaffold(
      appBar: AppBar(
        // title: Text("List View Route > Menu"),
        title: Text('${cart.restaurantName}'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "/cart");
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: completeMenu.length, // TODO: add food size as well
              itemBuilder: (BuildContext context, int index) {
                String key = completeMenu.keys.elementAt(index);
                double value = completeMenu.values.elementAt(index).toDouble();

                return Card(
                  color: Color(0xFFFFE500),
                  child: Column(
                    children: [
                      ListTile(
                        //leading: widget.photo,
                        title: Text(key,
                            style: TextStyle(fontWeight: FontWeight.bold,
                            fontSize: 25.0)),
                        subtitle: Row(
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(text: "Prijs: ",
                                      style: TextStyle(
                                        fontSize: 20.0
                                      )),
                                      TextSpan(
                                        text: "€" + value.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                alignment: Alignment.bottomCenter,
                                icon: Icon(Icons.add_shopping_cart),
                                color: Colors.black,
                                onPressed: () {
                                  // TODO: fix adding duplicates

                                    Provider.of<Cart>(context, listen: false)
                                        .addItem(key, value, 1);



                                  Scaffold.of(context).showSnackBar(SnackBar(
                                      content:
                                          Text("Added $key to your cart."),
                                          duration: Duration(seconds: 1),));
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

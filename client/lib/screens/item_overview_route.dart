import 'package:flutter/material.dart';
import 'item_menu_route.dart';

class GetItemValues extends StatefulWidget{
  GetItemValues(
      this.photo,
      this.itemName,
      this.price,
      this.amount,
      );

  final Widget photo;
  final String itemName;
  final double price;
  int amount;

  @override
  State<StatefulWidget> createState() {
    return BuildItemInfo();
  }
}

class BuildItemInfo extends State<GetItemValues>{
  static double totalPrice;

  void calculateTotalPrice(){
    totalPrice= widget.amount*widget.price;
}

  void amountAdd(){
    widget.amount++;
  }

  void amountSubtract(){
    widget.amount--;
  }

  Widget build(BuildContext context) {
    calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow,
          title: Text("Order",)
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: Container(
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: widget.photo,
                      title: Text(widget.itemName),
                      subtitle: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: (){
                              setState(() {
                                if(widget.amount!=0){
                                  amountSubtract();
                                  calculateTotalPrice();
                                }
                              });
                            },
                          ),
                          Text(widget.amount.toString()),
                          IconButton(
                            icon: Icon(Icons.add_circle),
                            onPressed: (){
                              setState(() {
                                amountAdd();
                                calculateTotalPrice();
                              });
                            },
                          )
                        ],
                      ),
                      trailing: Container(
                        child: RichText(
                            text: TextSpan(
                                style: DefaultTextStyle.of(context).style,
                                children: <TextSpan>[
                                  TextSpan(text: '€'),
                                  TextSpan(text: widget.price.toString())
                                ]
                            )
                        ),
                      )
                  ),
                  Divider(),
                  Row(
                    children: <Widget>[
                      Text('Totaal:  €'+ totalPrice.toString()),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 500,),
          Container(
            child: MaterialButton(
              minWidth: 300.0, // Hardcoded size, fix later!
              color: Colors.yellow,
              shape: RoundedRectangleBorder(
                // Make button rounded
                borderRadius: new BorderRadius.circular(50.0),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ItemMenu(); // Display new route
                    },
                  ),
                );
              },
              child: Text(
                // Button text
                'Volgende',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}
import 'dart:ffi';
import 'package:flutter/material.dart';

class ItemOverviewRoute extends StatefulWidget{
  final double price;
  final String itemName;

  ItemOverviewRoute({Key key, this.price, this.itemName}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BuildItemInfo();
  }
}

class BuildItemInfo extends State<ItemOverviewRoute>{
  static double totalPrice;
  int amount=1;

  @override
  Widget build(BuildContext context) {
    final Map<String, String> item = ModalRoute.of(context).settings.arguments;
    final itemName= item['itemName'];
    final price= double.parse(item['price']);

    void calculateTotalPrice(){
      totalPrice= amount*price;
    }

    void amountAdd(){
      amount++;
    }

    void amountSubtract(){
      amount--;
    }

    calculateTotalPrice();
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.yellow,
            title: Text("List View Route > Menu > Item",)
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                        title: Text(itemName),
                        subtitle: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.remove_circle),
                              onPressed: (){
                                setState(() {
                                  if(amount!=0){
                                    amountSubtract();
                                  }
                                });
                              },
                            ),
                            Text(amount.toString()),
                            IconButton(
                              icon: Icon(Icons.add_circle),
                              onPressed: (){
                                setState(() {
                                    amountAdd();
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
                                    TextSpan(text: price.toString())
                                  ]
                              )
                          ),
                        )
                    ),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text('Totaal:  € '+ totalPrice.toString()),
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
                },
                child: Text(
                  // Button text
                  'Toevoegen',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}
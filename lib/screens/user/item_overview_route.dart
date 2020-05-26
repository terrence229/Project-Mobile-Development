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
    final price= item['price'];

    void testRun() {
      print(item['itemName']);
      print(item['price']);
    }

    void calculateTotalPrice(){
      totalPrice= amount*widget.price;
    }

    void amountAdd(){
      amount++;
      print(amount);
    }

    void amountSubtract(){
      amount--;
      print(amount);
    }

    testRun();
    //calculateTotalPrice();
    // TODO: implement build
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
                                    //calculateTotalPrice();
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
                                    //calculateTotalPrice();
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

/*class GetItemValues extends StatefulWidget{
  GetItemValues(
      this.photo,
      this.itemName,
      this.price,
      );

  final Widget photo;
  final String itemName;
  final double price;
  int amount=1;

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
                'Toevoegen',
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
}*/
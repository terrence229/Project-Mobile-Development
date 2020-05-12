import 'dart:convert';

import 'package:flutter/material.dart';
import 'item_overview_route.dart';

class ItemMenu extends StatelessWidget{
  static const String id = 'item_menu_route';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow,
        title: Text("Menu",)
    ),
    body: BuildScreen(),
      );
  }
}

class BuildRestaurantCard extends StatefulWidget{
  
  BuildRestaurantCard({
    Key key,
    this.photo,
    this.restaurantName,
    this.openingHours,
    this.closingHours,
    this.walkingDistance,
  }): super (key: key);

  final Image photo;
  final String restaurantName;
  final String openingHours;
  final String closingHours;
  final String walkingDistance;

  @override
  State<StatefulWidget> createState(){
    return BuildRestaurantCardState();
  }
}

class BuildRestaurantCardState extends State<BuildRestaurantCard> {
  static bool favorite=false;

  void favoriteItem() {
    favorite=!favorite;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
          child: Container(
            height: 100,
            child: Column(
              children: [
                ListTile(
                    leading: widget.photo,
                    title: Text(widget.restaurantName,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              RichText(
                                  text: TextSpan(
                                      style: DefaultTextStyle.of(context).style,
                                      children: <TextSpan>[
                                        TextSpan(text: widget.openingHours + ' - ' + widget.closingHours),
                                      ]
                                  )
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.place),
                              Text(widget.walkingDistance),
                            ],
                          )
                        ]
                    ),
                    trailing:
                    IconButton(
                      icon: Icon(favorite? Icons.star: Icons.star_border),
                      onPressed: () {
                        setState(() {
                          favoriteItem();
                        });
                      },
                    )
                ),
              ],
            ),
          )
      ),
    );
  }
}

class BuildItemCard extends StatefulWidget{
  BuildItemCard({
    this.photo,
    this.itemName,
    this.description,
    this.price,
  });

  final Image photo;
  final String itemName;
  final String description;
  final double price;

  @override
  State<StatefulWidget> createState(){
    return BuildItemCardState();
  }
}

class BuildItemCardState extends State<BuildItemCard>{
  void sentInfo(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetItemValues(widget.photo, widget.itemName,  widget.price)
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Card(
              child: Column(
                children: [
                  ListTile(
                      leading: widget.photo,
                      title: Text(widget.itemName,
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text(widget.description),
                      trailing:Container(
                          height: 100,
                          color: Colors.yellow,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: RichText(
                                    text: TextSpan(
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(text: '€'),
                                          TextSpan(text: widget.price.toString())
                                        ]
                                    )
                                ),
                              ),
                              IconButton(
                                //alignment: Alignment.topCenter,
                                icon: Icon(Icons.arrow_forward_ios),
                                color: Colors.white,
                                onPressed: (){
                                  sentInfo();
                                },
                              )
                            ],
                          )
                      )
                  ),
                  Divider(),
                ],
              )
          ),
        )
    );
  }
}
/*
class Product {  // Class om de json response te initializen
  Product({
    this.photo,
    this.itemName,
    this.description,
    this.price,
  });

  final Image photo;
  final String itemName;
  final String description;
  final double price;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      itemName: json['itemName'],
      description: json['description'],
      price: json['price'],
    );
  }

  Map<String, dynamic> toJson() =>{
    'itemName': itemName,
    'description': description,
    'price': price
  };
}

class ProductCard extends StatelessWidget{ //Class om de state van een productkaart aan te maken/bij te houden
  ProductCard({
    this.product,
});
  final Product product;

  /*void sentInfo(){
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GetItemValues(product.photo, product.itemName, product.price)
        )
    );
  }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Container(
          child: Card(
              child: Column(
                children: [
                  ListTile(
                      //leading: widget.photo,
                      title: Text(product.itemName,
                          style: TextStyle(fontWeight: FontWeight.w500)),
                      subtitle: Text(product.description),
                      trailing:Container(
                          height: 100,
                          color: Colors.yellow,
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: RichText(
                                    text: TextSpan(
                                        style: DefaultTextStyle.of(context).style,
                                        children: <TextSpan>[
                                          TextSpan(text: '€'),
                                          TextSpan(text: product.price.toString())
                                        ]
                                    )
                                ),
                              ),
                              IconButton(
                                //alignment: Alignment.topCenter,
                                icon: Icon(Icons.arrow_forward_ios),
                                color: Colors.white,
                                onPressed: (){
                                  //sentInfo();
                                },
                              )
                            ],
                          )
                      )
                  ),
                  Divider(),
                ],
              )
          ),
        )
    );
  }
}

class ProductOverview extends StatefulWidget{

  @override
  State<StatefulWidget> createState(){
    return ProductOverviewState();
  }
}

class ProductOverviewState extends State<ProductOverview> {// Class om de get request uit te voeren en info te verwerken
  Product _product;

  initState() {
    retrieveData();
  }

  retrieveData() async {
    try {
      final product = NetworkHelper().getAllItems();
      setState(() => _product = product as Product);
    } catch (e) {
      debugPrint(e.toString());
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    if(_product ==null){
      return CircularProgressIndicator();
    }
    return ProductCard(
      product: _product,
    );
  }
}*/

class BuildScreen extends StatelessWidget{
  BuildScreen({Key key}) : super(key: key);

  /*void loadItems(){
    NetworkHelper().getItemInfo();
  }*/

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: <Widget>[
        BuildRestaurantCard(
          photo: Image.asset('assets/Burger.jpg'),
          restaurantName: 'Burger Bar',
          openingHours: '09:00',
          closingHours: '21:00',
          walkingDistance: '2.5km afstand',
        ),
        //ProductOverview(),
        BuildItemCard(
          photo: Image.asset('assets/Burger_met_Friet.jpg'),
          itemName: 'Hamburger met friet',//loadItemCard().toString(),
          description: 'Beef, sla, tomaat, augurk, huisgemaakte burgersaus, huisgemaakte friet',
          price: 10,
        ),
        BuildItemCard(
          photo: Image.asset('assets/Texas_Burger.jpg'),
          itemName: 'Texas Burger',
          description: 'Beef, sla, bacon, tomaat, augurk, pittige huisgemaakte burgersaus, huisgemaakte friet',
          price: 11.5,
        ),
        /*IconButton(
          icon: Icon(Icons.arrow_forward_ios),
          onPressed: (){
            //loadItemCard();
            loadItems();
          },
        ),*/
      ],
    );
  }
}
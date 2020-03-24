import 'package:flutter/material.dart';
import 'item_menu_route.dart';

class ItemOverview extends StatelessWidget{
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

class BuildItemInfo extends StatelessWidget{
/*  final Widget photo= BuildItemCard.photo;
  final String itemName= BuildItemCard.itemName;
  final String description= BuildItemCard.description;
  final String restaurantName= BuildRestaurantCard.restaurantName;
  final Float price= 0;
  final Float amount= 0;*/

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Text('Hi'),
                title: Text('Dit'),
                subtitle: Text('Is een nieuw'),
                trailing: Text('Scherm'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
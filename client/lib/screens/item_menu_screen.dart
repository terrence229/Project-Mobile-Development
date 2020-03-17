import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Burger Bar")
    ),
    body: MyStatelessWidget(),
      );
  }
}

class BuildRestaurantCard extends StatelessWidget{
  BuildRestaurantCard({
    Key key,
    this.photo,
    this.restaurantName,
    this.workingHours,
    this.walkingDistance,
}): super (key: key);

  final Image photo;
  final String restaurantName;
  final String workingHours;
  final String walkingDistance;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Card(
        child: ListTile(
          leading: photo,
          title: Text(restaurantName,
              style: TextStyle(fontWeight: FontWeight.w500)),
          subtitle: Text(workingHours),
          trailing: Text(walkingDistance),
          ),
      ),
    );
  }
}

class BuildItemCard extends StatelessWidget{
  BuildItemCard({
    Key key,
    this.photo,
    this.itemName,
    this.description,
  }): super (key: key);

  final Widget photo;
  final String itemName;
  final String description;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Card(
          child: Column(
            children: [
              ListTile(
                  leading: photo,
                  title: Text(itemName,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text(description),
                  trailing: Icon(Icons.arrow_forward_ios)
                ),
              Divider(),
            ],
          )
      ),
    );
  }
}

class MyStatelessWidget extends StatelessWidget{
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: <Widget>[
        BuildRestaurantCard(
          photo: Image.asset('assets/Burger.jpg'),
          restaurantName: 'Burger Bar',
          workingHours: '09:00 - 21:00',
          walkingDistance:'10 min loopafstand',
        ),
        BuildItemCard(
          photo: Image.asset('assets/Burger_met_Friet.jpg'),
          itemName: 'Hamburger met friet',
          description: 'Beef, sla, tomaat, augurk, huisgemaakte burgersaus, huisgemaakte friet',
        ),
        BuildItemCard(
          photo: Image.asset('assets/Texas_Burger.jpg'),
          itemName: 'Texas Burger',
          description: 'Beef, sla, bacon, augurk, pittege huisgemaakte burgersaus, huisgemaakte friet',
        )
      ],
    );
  }
}

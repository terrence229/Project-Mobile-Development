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
    this.title,
    this.subtitle,
  }): super (key: key);

  final Widget photo;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context){
    return Center(
      child: Card(
          child: Column(
            children: [
              ListTile(
                  leading: photo,
                  title: Text(title,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Text(subtitle),
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
        )
      ],
    );
  }
}

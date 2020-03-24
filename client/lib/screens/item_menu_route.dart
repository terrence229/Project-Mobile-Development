import 'package:flutter/material.dart';
import 'item_overview_route.dart';

class ItemMenu extends StatelessWidget{
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

class BuildRestaurantCard extends StatelessWidget{
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
  Widget build(BuildContext context){
    return Center(
      child: Card(
        child: Container(
          height: 100,
          child: Column(
            children: [
              ListTile(
                  leading: photo,
                  title: Text(restaurantName,
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  subtitle: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            RichText(
                                text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                        TextSpan(text: openingHours.toString()),
                                        TextSpan(text: ' - '),
                                        TextSpan(text: closingHours.toString())
                                      ]
                                  )
                              ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(Icons.place),
                            Text(walkingDistance),
                          ],
                        )
                      ]
                  ),
                  trailing:
                  IconButton(
                    icon: Icon(Icons.star_border),
                    onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context){
                                return ItemOverview();
                              }
                          )
                      );
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

/*class BuildItemCard extends StatefulWidget{
  @override
  BuildItemCardState createState() => BuildItemCardState();
}*/

class BuildItemCardState extends StatelessWidget {
  BuildItemCardState({
    Key key,
    this.photo,
    this.itemName,
    this.description,
    this.price,
  }) : super (key: key);

  final Widget photo;
  final String itemName;
  final String description;
  final double price;

  static int amount;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Card(
            child: Column(
              children: [
                ListTile(
                    leading: photo,
                    title: Text(itemName,
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    subtitle: Text(description),
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
                                        TextSpan(text: price.toString())
                                      ]
                                  )
                              ),
                            ),
                            IconButton(
                              //alignment: Alignment.topCenter,
                              icon: Icon(Icons.arrow_forward_ios),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return ItemOverview();
                                      },
                                    )
                                );
                              }
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

class BuildScreen extends StatelessWidget{
  BuildScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: <Widget>[
        BuildRestaurantCard(
          photo: Image.asset('assets/Burger.jpg'),
          restaurantName: 'Burger Bar',
          openingHours: '09:00',
          closingHours: '21:00',
          walkingDistance:'2.5km afstand',
        ),
        BuildItemCardState(
          photo: Image.asset('assets/Burger_met_Friet.jpg'),
          itemName: 'Hamburger met friet',
          description: 'Beef, sla, tomaat, augurk, huisgemaakte burgersaus, huisgemaakte friet',
          price: 10,
        ),
        BuildItemCardState(
          photo: Image.asset('assets/Texas_Burger.jpg'),
          itemName: 'Texas Burger',
          description: 'Beef, sla, bacon, augurk, pittige huisgemaakte burgersaus, huisgemaakte friet',
          price: 10.5,
        )
      ],
    );
  }
}
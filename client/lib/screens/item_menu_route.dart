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
                                        TextSpan(text: openingHours),
                                        TextSpan(text: ' - '),
                                        TextSpan(text: closingHours)
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

class BuildItemCard extends StatefulWidget{
  BuildItemCard({
    this.photo,
    this.itemName,
    this.description,
    this.price,
    this.amount,
  });

  final Image photo;
  final String itemName;
  final String description;
  final double price;
  int amount;

  @override
  State<StatefulWidget> createState(){
    return BuildItemCardState();
  }
}

class BuildItemCardState extends State<BuildItemCard>{
  void addItem(){
    setState(() {
      widget.amount++;
    });
  }

  void changePage() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context)
            {
              return ItemOverview();
            }
        )
    );
  }

  void sentInfo(){
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GetItemValues(widget.photo, widget.itemName, widget.description, widget.price, widget.amount)
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
                                addItem();
                                sentInfo();
                                changePage();
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
        BuildItemCard(
          photo: Image.asset('assets/Burger_met_Friet.jpg'),
          itemName: 'Hamburger met friet',
          description: 'Beef, sla, tomaat, augurk, huisgemaakte burgersaus, huisgemaakte friet',
          price: 10,
          amount: 0,
        ),
        BuildItemCard(
          photo: Image.asset('assets/Texas_Burger.jpg'),
          itemName: 'Texas Burger',
          description: 'Beef, sla, bacon, tomaat, augurk, pittige huisgemaakte burgersaus, huisgemaakte friet',
          price: 11.5,
          amount: 0,
        )
      ],
    );
  }
}
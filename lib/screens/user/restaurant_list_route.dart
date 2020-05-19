import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:woosttogo/components/data_list.dart';

class RestaurantListRoute extends StatefulWidget {
  @override
  _RestaurantListRouteState createState() => _RestaurantListRouteState();
}

class _RestaurantListRouteState extends State<RestaurantListRoute> {
  final _firestore = Firestore.instance;

  Future<Map> getData() async {
    var test =
        (await Firestore.instance.collection('restaurants').getDocuments())
            .documents;
    Map<String, dynamic> holder = test[0].data['menu']['drinks'];
    return holder;
  }

  // Prints out each menu item.
  // Currently not used but code is useful for later
  Future<String> menuDisplay() async {
    var documents =
        (await Firestore.instance.collection('restaurants').getDocuments())
            .documents;

    for (var document in documents) {
      Map<String, dynamic> holder = document.data['menu']['drinks'];
      holder.forEach((k, v) => print('${k}'));
    }

    return "Nothing here yet!";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection('restaurants').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final fireData = snapshot.data.documents;

                  List<Widget> dataWidgets = [];

                  for (var dataUnit in fireData) {
                    final restaurantName = dataUnit.data['name'];
                    final restaurantLocation = dataUnit.data['location'];
                    final openingHours = dataUnit.data['hours'];
                    final menu = dataUnit.data['menu'];

                    // Puts items in list
                    // final dataList = DataList(
                    //   restaurant: restaurantName,
                    //   location: restaurantLocation,
                    //   hours: openingHours,
                    //   menu: menu,
                    // );

                    final restaurantWidget = RestaurantCard(
                        restaurantName: restaurantName,
                        restaurantLocation: restaurantLocation,
                        openingHours: openingHours,
                        menu: menu);

                    dataWidgets.add(restaurantWidget);
                  }

                  // Hier staan alle items
                  return Expanded(
                    // Expanded to use whole screen
                    child: ListView(
                      // ListView allows scrolling
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 20.0),
                      children: dataWidgets,
                    ),
                  );
                } else {
                  return Center(
                    // TODO: work out error later
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Prinst format restaurant information
class RestaurantCard extends StatelessWidget {
  RestaurantCard({this.restaurantName,
    this.restaurantLocation,
    this.openingHours,
    this.menu});

  final String restaurantName;
  final String restaurantLocation;
  final String openingHours;
  final Map<String, dynamic> menu;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          child: Card(
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    //leading: widget.photo,
                      title: Text(restaurantName,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold,
                          )),
                      subtitle: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                color: Colors.black,
                                size: 20.0,
                              ),
                              RichText(
                                text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(text: restaurantLocation),
                                    ]
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: <TextSpan>[
                                      TextSpan(text: "Open tussen: "),
                                      TextSpan(text: openingHours, style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                    ]
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      trailing: Container(
                          height: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.yellow,
                          ),
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                alignment: Alignment.bottomCenter,
                                icon: Icon(Icons.arrow_forward_ios),
                                color: Colors.black,
                                onPressed: () {
                                  print("You pressed the" + restaurantName +
                                      " button");

                                  // TODO: fix hardcoded drinks and food transfer
                                  Navigator.pushNamed(context, "/adminmenuview",
                                      arguments: {
                                        'drinks': menu.values.elementAt(0),
                                        'food': menu.values.elementAt(1)
                                      });
                                },
                              )
                            ],
                          )
                      )
                  ),
                ],
              )
          ),
        )
    );
  }
}

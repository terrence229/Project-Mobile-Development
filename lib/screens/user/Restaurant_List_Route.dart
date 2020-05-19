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
  RestaurantCard(
      {this.restaurantName,
        this.restaurantLocation,
        this.openingHours,
        this.menu});

  final String restaurantName;
  final String restaurantLocation;
  final String openingHours;
  final Map<String, dynamic> menu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Material(
        elevation: 5.0,
        color: Colors.yellow,
        child: MaterialButton(
          onPressed: () => {
            print("You pressed the" + restaurantName + " button"),

            // TODO: fix hardcoded drinks and food transfer
            Navigator.pushNamed(context, "/adminmenuview", arguments: {
              'drinks': menu.values.elementAt(0),
              'food': menu.values.elementAt(1)
            }),
          },
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            child: Column(
              children: <Widget>[
                Align(
                  // Align to align left
                  alignment: Alignment.centerLeft, // Aligning
                  child: Text(restaurantName,
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ),
                Align(
                  // Align to align left
                  alignment: Alignment.centerLeft, // Aligning
                  child: Text(openingHours,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 15.0,
                    ),),
                ),
                Align(
                  // Align to align left
                  alignment: Alignment.centerLeft, // Aligning
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 30.0,
                      ),
                      Padding(
                        // Padding to distance text frm icon
                        padding: EdgeInsets.only(left: 5.0),
                        child: Text(restaurantLocation,
                            style: TextStyle(
                              fontSize: 15.0,
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

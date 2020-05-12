import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ListRoute extends StatefulWidget {
  @override
  _ListRouteState createState() => _ListRouteState();
}

class _ListRouteState extends State<ListRoute> {
  final _firestore = Firestore.instance;

  void getData() async {
    // Geeft een stream van values. Zie het als een lijst van Futures
    await for(var snapshot in _firestore.collection('restaurants').snapshots()) {
      for (var data in snapshot.documents) {
        print(data.data);
      }
    };
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
                  List<Text> dataWidgets = [];
                  for (var dataUnit in fireData) {
                    final restaurantName = dataUnit.data['name'];
                    final openingHours = dataUnit.data['hours'];
                    final menu = dataUnit.data['menu'];

                    final dataWidget = Text('$restaurantName, $menu, open on $openingHours');
                    dataWidgets.add(dataWidget);
                  }
                  return Column(
                    children: dataWidgets,
                  );
                } else {
                  return Center(
                    // TODO: work out error later
                  );
                }
              },
            ),
            new MaterialButton(
              minWidth: 200.0,
              height: 35,
              color: Color(0xFF801E48),
              child: new Text('Show List',
                  style: new TextStyle(fontSize: 16.0, color: Colors.white)),
              onPressed: () {
                getData();
                print("Show List");
              },
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ShowMenuRoute extends StatelessWidget {
  final Map<String, dynamic> menu;
  ShowMenuRoute({Key key, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Gets menu from previous route.
    final Map<String, dynamic> menu = ModalRoute.of(context).settings.arguments;

    Map<String, dynamic> completeMenu = {};
    completeMenu.addAll(menu['food']);
    completeMenu.addAll(menu['drinks']);

    void testRun() {
      print(completeMenu.toString());
    }

    int drinksSize = menu["drinks"].length;
    int foodSize = menu["food"].length;

    testRun();
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Route > Menu"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: completeMenu.length, // TODO: add food size as well
              itemBuilder: (BuildContext context, int index) {
                String key = completeMenu.keys.elementAt(index);
                double value =
                    completeMenu.values.elementAt(index).toDouble();

                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: new Column(
                    children: <Widget>[
                      Material(
                        elevation: 5.0,
                        color: Colors.yellow,
                        child: MaterialButton(
                          onPressed: () => {
                            print("You pressed the " + key + " button"),
                          },
                          child: Align(
                            // Align to align left
                            alignment: Alignment.centerLeft, // Aligning
                            child: new Text(
                              '$key costs €$value',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

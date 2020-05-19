import 'package:flutter/material.dart';


class ShowMenuRoute extends StatelessWidget {
  final String menu;

  ShowMenuRoute({Key key, this.menu}) : super(key: key); 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List View Route > Menu"),
      ),
      body: Center(
        child: Text('$menu'),
      ),
    );
  }
}

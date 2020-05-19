import 'package:flutter/material.dart';


class ShowMenuRoute extends StatelessWidget {
  final Map<String, dynamic> menu;

  ShowMenuRoute({Key key, this.menu}) : super(key: key); 



  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> menu = ModalRoute.of(context).settings.arguments;

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

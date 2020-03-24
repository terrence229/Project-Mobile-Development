import 'package:flutter/material.dart';

class ItemOverview extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow,
          title: Text("Order",)
      ),
      //body: BuildScreen(),
    );
  }
}

class GetItemValues extends StatefulWidget{
  GetItemValues(
      this.photo,
      this.itemName,
      this.description,
      this.price,
      this.amount,
      );

  final Widget photo;
  final String itemName;
  final String description;
  final double price;
  final int amount;

  @override
  State<StatefulWidget> createState() => BuildItemInfo();
}

class BuildItemInfo extends State<GetItemValues>{
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: widget.photo,
                title: Text(widget.itemName),
                subtitle: Text(widget.description),
                trailing: Text(widget.amount.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BuildScreen extends StatelessWidget{
  BuildScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //GetItemValues(

        //)
      ],
    );
  }
}
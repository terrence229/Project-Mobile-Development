import 'package:flutter/material.dart';

class PaymentRoute extends StatefulWidget {
  @override
  _PaymentRouteState createState() => _PaymentRouteState();
}

class _PaymentRouteState extends State<PaymentRoute> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575), // Matches edge color to grayed out background.
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Input Payment Details',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26.0,

              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
            ),
            MaterialButton(
              child: Text(
                'Add',
              ),
              color: Colors.yellow,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

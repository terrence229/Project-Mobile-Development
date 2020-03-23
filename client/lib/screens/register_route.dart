import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:requests/requests.dart';

/**
 * Register page
 */
class RegisterRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Route"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            MaterialButton(
              minWidth: 300.0, // Hardcoded size, fix later!
              color: Colors.black,
              shape: RoundedRectangleBorder(
                // Make button rounded
                borderRadius: new BorderRadius.circular(50.0),
              ),
              onPressed: () {
              	testGet();  
              },
              child: Text(
                // Button text
                'GET',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Test get
testGet() async {
	var r = await Requests.get("http://localhost:1337/test");
	r.raiseForStatus();
	String body = r.content();
}

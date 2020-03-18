import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

// TODO: fix handshake exception
testGet() async {
  final response = await http.get('https://localhost:1337/test');

  if (response.statusCode == 200) {
	 return 1;
  } else {
    throw Exception('Failed to load album');
  }
}

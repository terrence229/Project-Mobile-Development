import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:woosttogo/screens/item_menu_route.dart';

/// Used to get data from backend
/// All requests are sent using the application/json header
class NetworkHelper {
  /// REST API URL
  ///
  /// If you get weird errors on Android, change localhost to
  /// your own local IP adress.
  /// info: https://github.com/hillelcoren/flutter-redux-starter/issues/16
  final String URL = "http://10.0.2.2:1337";
  final storage = FlutterSecureStorage();

  /// Sends a login POST request to the backend
  /// Should return a JWT
  Future<String> loginPost(email, password) async {
    Map loginData = {
      'email': '$email',
      'password': '$password',
    };

    var body = json.encode(loginData);

    http.Response response = await http.post("$URL/login",
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: body);

    if (response.statusCode == 200) {
      return response.body; // Contains the JWT
    } else {
      print(response.statusCode);
    }
  }

  /// Sends a register POST request to the backend
  Future<String> registerPost(email, password) async {
    Map registerData = {
      'email': '$email',
      'password': '$password',
    };

    var body = json.encode(registerData);

    http.Response response = await http.post("$URL/register",
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: body);

    if (response.statusCode == 201) {
      return response.body; // Contains the JW
    } else {
      print(response.statusCode);
    }
  }

  /*Future<List<Product>> getAllItems() async {
    http.Response response = await http.get("$URL/getAllItems",
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if (response.statusCode == 200) {
      final jSon = json.decode(response.body);
      final products = List.from(jSon).map((item) => Product.fromJson(item));
      return products; // // Contains the item data
    } else {
      print(response.statusCode);
    }
  }

  Future<String> getItemInfo() async {
    http.Response response = await http.get("$URL/getAllItems",
      headers: {HttpHeaders.contentTypeHeader: "application/json"},
    );
    if (response.statusCode == 200) {
      final jSon = json.decode(response.body);
      print(jSon); // Contains the JWT
    } else {
      print(response.statusCode);
    }
  }*/
}

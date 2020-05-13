import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';

/// Used to get data from backend
/// All requests are sent using the application/json header
class NetworkHelper {
  /// REST API URL
  ///
  /// If you get weird errors on Android, change localhost to
  /// your own local IP adress.
  /// info: https://github.com/hillelcoren/flutter-redux-starter/issues/16
  
  final _auth = FirebaseAuth.instance; // Used to authenticate user

  // final String URL = "http://10.0.2.2:1337"; // Uncomment if Android
  final String URL = "http://localhost:1337"; // Uncomment if iOS


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
  Future<String> registerUser(email, password) async {
    Map registerData = {
      'email': '$email',
      'password': '$password',
    };



    final newUser =_auth.createUserWithEmailAndPassword(email: email, password: password);

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

import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Used to get data from backend
/// All requests are sent using the application/json header
class NetworkHelper {
  /// REST API URL
  ///
  /// If you get weird errors on Android, change localhost to
  /// your own local IP adress.
  /// info: https://github.com/hillelcoren/flutter-redux-starter/issues/16

  // final String URL = "http://10.0.2.2:1337"; // Uncomment if Android
  final String URL = "http://localhost:1337"; // Uncomment if iOS
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
      return response.body; // Contains the JWT
    } else {
      print(response.statusCode);
    }
  }
}

import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';

/// Used to get data from backend
class NetworkHelper {
  /// REST API URL
  ///
  /// If you get weird errors on Android, change localhost to
  /// your own local IP adress.
  /// info: https://github.com/hillelcoren/flutter-redux-starter/issues/16
  final String registerURL = "http://localhost:1337/register";
  final String loginURL = "http://localhost:1337/login";

  /// Sends a login POST request to the backend
  /// Should return a JWT
  Future loginPost(email, password) async {
    Map loginData = {
      'email': '$email',
      'password': '$password',
    };

    var body = json.encode(loginData);

    http.Response response = await http.post(loginURL,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: body);

    if (response.statusCode == 200) {
      String data = response.body;
      print(data); // Should print JWT to console!
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }


  /// Sends a register POST request to the backend
  Future registerPost(name, email, password) async {
    Map registerData = {
      'name': '$name',
      'email' : '$email',
      'password': '$password',
    };

    var body = json.encode(registerData);

    http.Response response = await http.post(registerURL,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: body);

    if (response.statusCode == 201) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}

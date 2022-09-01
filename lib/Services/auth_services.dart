import 'dart:convert';

import 'package:pathstrides_mobile/Services/globals.dart';
import 'package:http/http.dart' as http;


class AuthServices {
  static Future<http.Response> register(
      String name, String email, String password) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    //  var fullUrl = _url + apiUrl + await _getToken();
    // return await http.post(Uri.parse(fullUrl),
    //     body: jsonEncode(data), headers: _setHeaders());
    var body = json.encode(data);
    // ignore: prefer_interpolation_to_compose_strings
    var url = Uri.parse(baseURL + 'auth/loginEmployee');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}

// ignore_for_file: prefer_interpolation_to_compose_strings, avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/product.dart';
import '../models/cart.dart';
import '../models/cart_update.dart';

class CallApi {
  final String _url = 'http://10.0.2.2:8000/api/';
  static const String baseUrl = 'http://10.0.2.2:8000/api/';

  getEmployeeTaskData(apiUrl) async {
    http.Response response = await http.get(Uri.parse(_url + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }

  getAnnouncementData(apiUrl) async {
    http.Response response = await http.get(Uri.parse(_url + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }

  getRedeemShop(apiUrl) async {
    http.Response response = await http.get(Uri.parse(_url + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }

  getProfileData(apiUrl) async {
    http.Response response = await http.get(Uri.parse(_url + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }

  // Future postData(data, apiUrl) async {
  //   var fullUrl = _url + apiUrl + await _getToken();
  //   return await http.post(Uri.parse(fullUrl),
  //       body: jsonEncode(data), headers: _setHeaders());
  // }

  // Future getData(apiUrl) async {
  //   var fullUrl = _url + apiUrl + await _getToken();
  //   return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  // }

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  static const headers = {'Content-type': 'application/json'};

  Future<Product?> getProduct(int id) {
    return http.get(Uri.parse('$baseUrl/products/$id')).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return Product.fromJson(jsonData);
      }
      return null;
    }).catchError((err) => print(err));
  }

  Future<List<Product>> getAllProducts() async {
    return http
        .get(Uri.parse('$baseUrl/products'), headers: headers)
        .then((data) {
      final products = <Product>[];
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        for (var product in jsonData) {
          products.add(Product.fromJson(product));
        }
      }
      return products;
    }).catchError((error) => print(error));
  }

  Future<void> updateCart(int cartId, int productId) {
    final cartUpdate =
        UpdateCart(userId: cartId, date: DateTime.now(), products: [
      {'productId': productId, 'quantity': 1}
    ]);
    return http
        .put(Uri.parse('$baseUrl/carts/$cartId'),
            body: json.encode(cartUpdate.toJson()))
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
      }
    }).catchError((err) => print(err));
  }

  Future<Cart?> getCart(String id) {
    return http
        .get(Uri.parse('$baseUrl/carts/$id'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        return Cart.fromJson(jsonData);
      }
      return null;
    }).catchError((err) => print(err));
  }

  Future<void> deleteCart(String cartId) {
    return http
        .delete(Uri.parse('$baseUrl/carts/$cartId'), headers: headers)
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print(jsonData);
      }
    }).catchError((err) => print(err));
  }
}

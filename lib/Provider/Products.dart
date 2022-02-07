import 'dart:convert';

import 'package:bisesh_dairy_udyog_app/utils/ServerLink.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Product {
  int id;
  String productName;
  int productRate;
  int productUnit;
  Product({this.id, this.productName, this.productUnit, this.productRate});
}

class Products extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> get products {
    return [..._products];
  }

  Future<void> fetchProductFromServer() async {
    var url = Uri.parse("$link/product");

    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        var productData = jsonDecode(response.body);
        print("================Product");
        print(response.statusCode);
        print(productData);
        print("================Product");

        List<Product> tempHolder = [];

        productData.forEach((product) {
          tempHolder.add(Product(
            id: product["id"],
            productName: product["productName"],
            productUnit: product["productUnit"],
            productRate: product["productRate"],
          ));
        });
        _products = tempHolder;
        notifyListeners();
      } else {
        throw "Can't get Products";
      }
    } catch (err) {
      print("======ProductERR01");
      print(err);
      print("======ProductERR02");
    }
  }

  Product getProductById(int id) {
    return _products.where((element) => element.id == id).first;
  }
}

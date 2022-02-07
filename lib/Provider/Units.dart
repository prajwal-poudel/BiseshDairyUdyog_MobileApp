import 'dart:convert';

import 'package:bisesh_dairy_udyog_app/utils/ServerLink.dart';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;

class ProductUnit {
  int id;
  String productUnit;
  ProductUnit({this.id, this.productUnit});
}

class ProductUnitProvider extends ChangeNotifier {
  List<ProductUnit> _productUnits = [];

  List<ProductUnit> get productUnit {
    return [..._productUnits];
  }

  // Server Call
  Future getAllProductUnits() async {
    var url = Uri.parse("$link/unit");

    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body)["data"];
        print("=========Units01");
        print(responseData);
        print("=========Units02");
        List<ProductUnit> tempHolder = [];
        responseData.forEach((unit) {
          tempHolder.add(
              ProductUnit(id: unit["id"], productUnit: unit["productUnit"]));
        });
        _productUnits = tempHolder;
        notifyListeners();
      } else {
        throw "Can't get Unit";
      }
    } catch (err) {
      throw err;
    }
  }

  ProductUnit findProductUnitById(int id) {
    return _productUnits.where((element) => element.id == id).first;
  }
}

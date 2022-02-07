import 'dart:convert';

import 'package:bisesh_dairy_udyog_app/utils/ServerLink.dart';
import 'package:flutter/foundation.dart';
import "package:http/http.dart" as http;

class BoughtProduct {
  int id;
  int productId;
  double quantity;
  double totalAmount;
  bool paid;
  DateTime boughtDate;
  double payment;
  double duePayment;

  BoughtProduct(
      {this.id,
      this.productId,
      this.quantity,
      this.totalAmount,
      this.paid,
      this.boughtDate,
      this.payment,
      this.duePayment});
}

class BoughtProductProvider extends ChangeNotifier {
  List<BoughtProduct> _boughtProduct = [];

  List<BoughtProduct> get boughtProduct {
    return [..._boughtProduct];
  }

  Future getAllBoughtProductByUserId() async {
    Uri url = Uri.parse("$link/boughtproduct/getbyuserid/1");

    try {
      http.Response response = await http.get(url);
      var data = jsonDecode(response.body)["data"];
      List<BoughtProduct> tempHolder = [];

      data.forEach((boughtProduct) {
        double paidAmount = 0;
        double dueAmount = 0;
        if (boughtProduct["paid"]) {
          paidAmount = double.parse(boughtProduct["totalAmount"]);
          dueAmount = 0;
        } else {
          paidAmount =
              double.parse(boughtProduct["duePayments"][0]["paidAmount"]);
          dueAmount =
              double.parse(boughtProduct["duePayments"][0]["totalAmountToPay"]);
        }

        tempHolder.add(BoughtProduct(
            id: boughtProduct["id"],
            productId: boughtProduct["productId"],
            quantity: double.parse(boughtProduct["quantity"].toString()),
            totalAmount: double.parse(boughtProduct["totalAmount"]),
            paid: boughtProduct["paid"],
            boughtDate: DateTime.parse(boughtProduct["boughtDate"]),
            payment: paidAmount,
            duePayment: dueAmount));
      });
      _boughtProduct = tempHolder;
      print("==============Bought Product 001");
      print(_boughtProduct.length);
      print("==============Bought Product 002");
    } catch (err) {
      print(err);
      throw err;
    }
  }

  BoughtProduct getBoughtProductById(int id) {
    return _boughtProduct.where((element) => element.id == id).first;
  }

  List<BoughtProduct> getBoughtProductByMonth(int month) {
    return _boughtProduct
        .where((element) => element.boughtDate.month == month)
        .toList();
  }
}

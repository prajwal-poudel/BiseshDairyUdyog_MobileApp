import 'package:bisesh_dairy_udyog_app/Pages/PaymentHistory.dart';

import '../Widgets/BillBox.dart';
import '../Widgets/ListOfProductInThisMonth.dart';
import 'package:flutter/material.dart';

class ThisMonthdetails extends StatefulWidget {
  static const routeName = "/pages/home/thismonthdetails";
  @override
  _ThisMonthdetailsState createState() => _ThisMonthdetailsState();
}

class _ThisMonthdetailsState extends State<ThisMonthdetails> {
  List<Map<String, dynamic>> products = [
    {"productName": "Milk", "unit": "Ltr", "rate": 80, "quantity": 100},
    {"productName": "Panir", "unit": "Kg", "rate": 650, "quantity": 50},
    {"productName": "Dhai", "unit": "Kg", "rate": 100, "quantity": 5},
    {"productName": "Cheese", "unit": "kg", "rate": 210, "quantity": 3},
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var monthData = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            child: Column(
              children: [
                SafeArea(
                    child: Container(
                  alignment: Alignment.topCenter,
                  width: width,
                  height: height * 0.3,
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.04, vertical: height * 0.02),
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          iconSize: width * 0.095,
                          onPressed: () {
                            print("back");
                            Navigator.pop(context);
                          }),
                      Text(
                        "${monthData["month"]}".toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.07),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.info,
                            color: Colors.white,
                          ),
                          iconSize: width * 0.07,
                          onPressed: () {
                            print("info");
                            Navigator.pushNamed(
                                context, PaymentHistory.routeName);
                          }),
                    ],
                  ),
                )),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.15),
                  child: Container(
                    width: width,
                    height: height * 0.5,
                    child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (context, index) =>
                            listOfProductInThisMonth(
                                height: height,
                                width: width,
                                context: context,
                                product: products[index])),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: height * 0.35,
            right: width * 0.125,
            child: billBox(
                paid: 1000,
                subtotal: monthData["total"],
                height: height,
                width: width),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

Widget listOfProductInThisMonth(
    {@required BuildContext context,
    @required double width,
    @required double height,
    @required Map<String, dynamic> product}) {
  return Padding(
    padding: EdgeInsets.only(
        bottom: height * 0.03, left: width * 0.04, right: width * 0.04),
    child: Container(
      height: height * 0.11,
      width: width,
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                spreadRadius: 3,
                blurRadius: 3,
                color: Colors.grey.withOpacity(0.3),
                offset: Offset(1, 1))
          ],
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${product["productName"]}".toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.055),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: height * 0.015),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text("Qty: ${product["quantity"]}"),
                      Padding(
                        padding: EdgeInsets.only(left: width * 0.05),
                        child: Text("Rate: ${product["rate"]}"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: width * 0.05,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text(
                  "RS. ${(product["quantity"] * product["rate"])}",
                  style: TextStyle(
                      fontSize: width * 0.05, fontWeight: FontWeight.bold),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

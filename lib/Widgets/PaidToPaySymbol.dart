import 'package:flutter/material.dart';

Widget paidToPaySymbol({@required double height, @required double width}) {
  return Container(
    width: width,
    height: height * 0.04,
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          spreadRadius: 1,
          blurRadius: 1,
          color: Colors.grey.withOpacity(0.1),
          offset: Offset(0, -1))
    ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          children: [
            Container(
              height: height * 0.02,
              width: height * 0.02,
              color: Colors.red,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.03),
              child: Text("To Pay"),
            )
          ],
        ),
        Row(
          children: [
            Container(
              height: height * 0.02,
              width: height * 0.02,
              color: Colors.green,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.03),
              child: Text("Paid"),
            )
          ],
        ),
      ],
    ),
  );
}

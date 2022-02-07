import 'package:flutter/material.dart';

Widget headerBar(
    {@required BuildContext context,
    @required double height,
    @required double width,
    @required String title}) {
  return SafeArea(
    child: Container(
      width: width,
      height: height * 0.07,
      decoration:
          BoxDecoration(color: Theme.of(context).primaryColor, boxShadow: [
        BoxShadow(
            spreadRadius: 1,
            blurRadius: 1,
            color: Colors.grey.withOpacity(0.4),
            offset: Offset(0, 2))
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${title}".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.07,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

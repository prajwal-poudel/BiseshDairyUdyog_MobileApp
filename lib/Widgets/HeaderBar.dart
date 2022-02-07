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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              )),
          Text(
            "${title}".toUpperCase(),
            style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Theme.of(context).primaryColor,
              )),
        ],
      ),
    ),
  );
}

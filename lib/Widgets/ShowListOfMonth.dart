import 'package:bisesh_dairy_udyog_app/Pages/ThisMonthDetail.dart';
import 'package:flutter/material.dart';

Widget showListOfMonth(
    {@required BuildContext context,
    @required double height,
    @required double width,
    @required String month,
    @required var total,
    @required Color color,
    @required Color textColor}) {
  return Padding(
    padding: EdgeInsets.only(
        bottom: height * 0.04, left: width * 0.04, right: width * 0.04),
    child: GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ThisMonthdetails.routeName,
            arguments: {"month": month, "total": total});
      },
      child: Container(
        height: height * 0.11,
        width: width,
        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
        decoration: BoxDecoration(
            color: color,
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
              "$month".toUpperCase(),
              style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.07),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: width * 0.05, color: textColor),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.01),
                  child: Text(
                    "RS. $total",
                    style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: textColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';

Widget paymentHistoryList(
    {@required int date, @required double paid, @required double toPay}) {
  return Container(
    child: Column(
      children: [
        ListTile(
          leading: Text("${date}"),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Rs ${toPay} ",
                style: TextStyle(color: Colors.red),
              ),
              Text(
                "Rs ${paid} ",
                style: TextStyle(color: Colors.green),
              ),
            ],
          ),
        ),
        Divider()
      ],
    ),
  );
}

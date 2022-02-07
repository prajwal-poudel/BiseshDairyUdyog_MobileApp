import 'package:bisesh_dairy_udyog_app/Widgets/BottomNavigationBar.dart';
import 'package:bisesh_dairy_udyog_app/Widgets/HeaderBar.dart';
import 'package:bisesh_dairy_udyog_app/Widgets/PaidToPaySymbol.dart';
import 'package:bisesh_dairy_udyog_app/Widgets/PaymentHistoryList.dart';
import 'package:flutter/material.dart';

class PaymentHistory extends StatefulWidget {
  static const routeName = "/home/navigate/paymentHistory";
  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  var _monthValue = 0;
  var _yearValue = 0;

  List<String> monthlist = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  List<int> yearList = [2015, 2016, 2017, 2018, 2019, 2020, 2021];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            headerBar(
                context: context,
                height: height,
                width: width,
                title: "Payment History"),
            Container(
              width: width,
              height: height * 0.12,
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                    height: height * 0.05,
                    width: width * 0.35,
                    decoration: BoxDecoration(border: Border.all()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _monthValue,
                        iconSize: width * 0.08,
                        items: monthlist
                            .asMap()
                            .entries
                            .map((MapEntry e) => DropdownMenuItem(
                                child: Text(
                                  monthlist[e.key],
                                ),
                                value: e.key))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _monthValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    height: height * 0.05,
                    width: width * 0.25,
                    decoration: BoxDecoration(border: Border.all()),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: _yearValue,
                        iconSize: width * 0.08,
                        items: yearList
                            .asMap()
                            .entries
                            .map((MapEntry e) => DropdownMenuItem(
                                  child: Text("${yearList[e.key]}"),
                                  value: e.key,
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            _yearValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 0.01),
              child: Container(
                width: width,
                height: height * 0.56,
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (ctx, index) => paymentHistoryList(
                        date: index + 1, paid: 100, toPay: 4000)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.01),
              child: Container(
                width: width * 0.96,
                height: height * 0.06,
                decoration: BoxDecoration(border: Border.all()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Grand Total  =  Rs 7800",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.07),
                    ),
                  ],
                ),
              ),
            ),
            paidToPaySymbol(height: height, width: width),
            bottonNavigationBar(context: context, height: height, width: width)
          ],
        ),
      ),
    );
  }
}

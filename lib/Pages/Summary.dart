import 'package:bisesh_dairy_udyog_app/Provider/BoughtProduct.dart';
import 'package:bisesh_dairy_udyog_app/Provider/FiscalYearProvider.dart';
import 'package:bisesh_dairy_udyog_app/Widgets/BottomNavigationBar.dart';
import 'package:bisesh_dairy_udyog_app/Widgets/HeaderBar.dart';
import 'package:bisesh_dairy_udyog_app/Widgets/MonthDetailsList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Summary extends StatefulWidget {
  @override
  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
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
  // List<int> yearList = [2015, 2016, 2017, 2018, 2019, 2020, 2021];

  List<BoughtProduct> boughtProductThisMonth = [];

  getBoughtProduct(int month) {
    List<BoughtProduct> tempHolder =
        Provider.of<BoughtProductProvider>(context, listen: false)
            .getBoughtProductByMonth(month + 1);

    setState(() {
      boughtProductThisMonth = tempHolder;
    });
  }

  bool isBeginning = true;
  @override
  void didChangeDependencies() {
    if (isBeginning) {
      getBoughtProduct(0);
    }
    isBeginning = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    FiscalYear currentFiscalYear =
        Provider.of<FiscalYearProvider>(context).activeFiscalYear;
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
                title: "summary"),
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
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        iconEnabledColor: Theme.of(context).primaryColor,
                        value: _monthValue,
                        iconSize: width * 0.08,
                        items: monthlist
                            .asMap()
                            .entries
                            .map((MapEntry e) => DropdownMenuItem(
                                child: Text(
                                  monthlist[e.key],
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                ),
                                value: e.key))
                            .toList(),
                        onChanged: (value) {
                          getBoughtProduct(value);
                          setState(() {
                            _monthValue = value;
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                      alignment: Alignment.center,
                      height: height * 0.05,
                      width: width * 0.35,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor)),
                      child: Text(
                        "${currentFiscalYear.fiscalYear}",
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: width * 0.045),
                      )
                      // DropdownButtonHideUnderline(
                      //   child:
                      //   DropdownButton(
                      //     value: _yearValue,
                      //     iconSize: width * 0.08,
                      //     items: yearList
                      //         .asMap()
                      //         .entries
                      //         .map((MapEntry e) => DropdownMenuItem(
                      //               child: Text("${yearList[e.key]}"),
                      //               value: e.key,
                      //             ))
                      //         .toList(),
                      //     onChanged: (value) {
                      //       setState(() {
                      //         _yearValue = value;
                      //       });
                      //     },
                      //   ),
                      // ),
                      ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: height * 0.01, left: width * 0.03, right: width * 0.03),
              child: Container(
                // color: Colors.red,
                width: width,
                height: height * 0.72,
                child: boughtProductThisMonth.length == 0
                    ? Text(
                        "Nothing to show !!",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.red),
                      )
                    : ListView.builder(
                        itemCount: boughtProductThisMonth.length,
                        itemBuilder: (context, index) => monthDetailsList(
                            context: context,
                            boughtProduct: boughtProductThisMonth[index])),
              ),
            ),
            // bottonNavigationBar(context: context, height: height, width: width)
          ],
        ),
      ),
    );
  }
}

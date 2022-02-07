import 'package:bisesh_dairy_udyog_app/Provider/BoughtProduct.dart';
import 'package:bisesh_dairy_udyog_app/Provider/FiscalYearProvider.dart';
import 'package:bisesh_dairy_udyog_app/Provider/Products.dart';
import 'package:bisesh_dairy_udyog_app/Provider/Units.dart';
import 'package:bisesh_dairy_udyog_app/Widgets/HeaderBar.dart';
import 'package:bisesh_dairy_udyog_app/Widgets/ShowListOfMonth.dart';
import 'package:bisesh_dairy_udyog_app/Widgets/functionGrid.dart';
import 'package:bisesh_dairy_udyog_app/utils/colorParser.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Widgets//BottomNavigationBar.dart';

import 'package:scroll_to_index/scroll_to_index.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  DateTime now;
  var month;
  FiscalYear activeFiscalYear;
  AutoScrollController _autoScrollController;
  // void initState() {
  //   super.initState();
  //   now = DateTime.now();
  //   month = now.month;
  //   _autoScrollController = AutoScrollController(
  //       viewportBoundaryGetter: () =>
  //           Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
  //       axis: Axis.vertical);
  //   _scrollToIndex();
  // }

  bool isBeginning = true;

  void didChangeDependencies() {
    // print("===Run");
    // Provider.of<FiscalYearProvider>(context).getFiscalYear();
    // activeFiscalYear =
    //     Provider.of<FiscalYearProvider>(context).activeFiscalYear;
    // print(activeFiscalYear.fiscalYear);

    if (isBeginning) {
      Provider.of<Products>(context, listen: false).fetchProductFromServer();
      Provider.of<FiscalYearProvider>(context).getActiveFiscalYear();
      Provider.of<ProductUnitProvider>(context).getAllProductUnits();
      Provider.of<BoughtProductProvider>(context).getAllBoughtProductByUserId();
    }
    isBeginning = false;

    super.didChangeDependencies();
  }

  // Future _scrollToIndex() async {
  //   await _autoScrollController.scrollToIndex(month - 1,
  //       preferPosition: AutoScrollPosition.begin);
  // }

  List<Map<String, dynamic>> monthList = [
    {"month": "January", "total": 1500},
    {"month": "February", "total": 1100},
    {"month": "March", "total": 100},
    {"month": "April", "total": 10000},
    {"month": "May", "total": 0},
    {"month": "June", "total": 50},
    {"month": "July", "total": 400},
    {"month": "August", "total": 4000},
    {"month": "September", "total": 100},
    {"month": "October", "total": 10},
    {"month": "November", "total": 900},
    {"month": "December", "total": 1500},
  ];
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: ListView(
          children: [
            Container(
              height: height * 0.3,
              width: width,
              color: Colors.red,
              child: ClipRRect(
                child: Image.asset(
                  "assets/images/cover.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              child: functionGrid(context),
            )
          ],
        ),
      ),
      // Container(
      //   width: width,
      //   height: height * 0.92,
      //   child: Column(
      //     children: [
      //       headerBar(
      //           context: context,
      //           height: height,
      //           width: width,
      //           title: "Report"),
      //       Padding(
      //         padding: EdgeInsets.only(top: height * 0.08),
      //         child: Row(
      //           children: [
      //             Container(
      //               height: height * 0.075,
      //               width: width * 0.35,
      //               padding:
      //                   EdgeInsets.symmetric(horizontal: width * 0.03),
      //               decoration: BoxDecoration(
      //                   color: Theme.of(context).primaryColor),
      //               child: Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                 children: [
      //                   Text(
      //                     "${activeFiscalYear.fiscalYear}",
      //                     style: TextStyle(
      //                         color: Colors.white,
      //                         fontSize: width * 0.04),
      //                   ),
      //                   Container(
      //                       child: Icon(
      //                     Icons.unfold_more,
      //                     color: Colors.white,
      //                     size: width * 0.06,
      //                   )),
      //                 ],
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Padding(
      //         padding: EdgeInsets.only(top: height * 0.03),
      //         child: Container(
      //           width: width,
      //           height: height * 0.6,
      //           child: ListView.builder(
      //               controller: _autoScrollController,
      //               itemCount: 12,
      //               itemBuilder: (context, index) => AutoScrollTag(
      //                     key: ValueKey(index),
      //                     controller: _autoScrollController,
      //                     index: index,
      //                     child: showListOfMonth(
      //                       context: context,
      //                       height: height,
      //                       width: width,
      //                       month: monthList[index]["month"],
      //                       total: monthList[index]["total"],
      //                       color: month == index + 1
      //                           ? Theme.of(context).primaryColor
      //                           : Colors.white,
      //                       textColor: month == index + 1
      //                           ? Colors.white
      //                           : Colors.black,
      //                     ),
      //                   )),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      // bottonNavigationBar(context: context, height: height, width: width)
    );
  }
}

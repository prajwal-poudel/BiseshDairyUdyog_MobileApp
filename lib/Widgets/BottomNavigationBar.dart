import 'package:bisesh_dairy_udyog_app/Provider/BottomNavProvider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget bottonNavigationBar(
    {@required BuildContext context,
    @required double height,
    @required double width}) {
  List<Map<String, IconData>> data = [
    {"icon": Icons.home},
    {"icon": Icons.history},
    {"icon": Icons.menu},
  ];
  var navigationProvider = Provider.of<Navigations>(context);
  return AnimatedContainer(
    duration: Duration(milliseconds: 800),
    curve: Curves.bounceInOut,
    height: height * 0.08,
    width: width,
    padding: EdgeInsets.symmetric(horizontal: width * 0.05),
    decoration: BoxDecoration(color: Colors.white, boxShadow: [
      BoxShadow(
          blurRadius: 1,
          spreadRadius: 1,
          color: Colors.grey.withOpacity(0.3),
          offset: Offset(0, -1))
    ]),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: data
          .asMap()
          .entries
          .map((MapEntry e) => IconButton(
                icon: Icon(
                  data[e.key]["icon"],
                  color: navigationProvider.navigationIndex == e.key
                      ? Theme.of(context).primaryColor
                      : Colors.grey,
                  size: navigationProvider.navigationIndex == e.key
                      ? width * 0.11
                      : width * 0.1,
                ),
                onPressed: () {
                  navigationProvider.changeNavigationIndex(e.key);
                },
              ))
          .toList(),
    ),
  );
}

import 'package:bisesh_dairy_udyog_app/Pages/Home.dart';
import 'package:bisesh_dairy_udyog_app/Pages/LoginPage.dart';
import 'package:bisesh_dairy_udyog_app/Pages/PaymentHistory.dart';
import 'package:bisesh_dairy_udyog_app/Pages/Summary.dart';
import 'package:bisesh_dairy_udyog_app/Pages/ThisMonthDetail.dart';
import 'package:bisesh_dairy_udyog_app/Provider/BoughtProduct.dart';
import 'package:bisesh_dairy_udyog_app/Provider/FiscalYearProvider.dart';
import 'package:bisesh_dairy_udyog_app/Provider/Products.dart';
import 'package:bisesh_dairy_udyog_app/Provider/Units.dart';
import 'package:bisesh_dairy_udyog_app/Provider/functionalProvider.dart';
import 'package:bisesh_dairy_udyog_app/SelectPage.dart';
import 'package:bisesh_dairy_udyog_app/utils/colorParser.dart';
import 'package:bisesh_dairy_udyog_app/utils/material_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Provider/BottomNavProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Navigations()),
        ChangeNotifierProvider(create: (ctx) => Products()),
        ChangeNotifierProvider(create: (ctx) => FiscalYearProvider()),
        ChangeNotifierProvider(create: (ctx) => ProductUnitProvider()),
        ChangeNotifierProvider(create: (ctx) => BoughtProductProvider()),
        ChangeNotifierProvider(create: (ctx) => FunctionProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: colorCustom,
            primaryColor: colorCustom,
            scaffoldBackgroundColor: Colors.white),
        home: LoginPage(),
        routes: {
          ThisMonthdetails.routeName: (ctx) => ThisMonthdetails(),
          PaymentHistory.routeName: (ctx) => PaymentHistory()
        },
      ),
    );
  }
}

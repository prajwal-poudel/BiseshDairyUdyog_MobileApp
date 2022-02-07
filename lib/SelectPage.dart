import 'package:bisesh_dairy_udyog_app/Pages/Home.dart';
import 'package:bisesh_dairy_udyog_app/Pages/PaymentHistory.dart';
import 'package:bisesh_dairy_udyog_app/Pages/Summary.dart';
import 'package:bisesh_dairy_udyog_app/Provider/BottomNavProvider.dart';
import 'package:bisesh_dairy_udyog_app/Provider/BoughtProduct.dart';
import 'package:bisesh_dairy_udyog_app/Provider/FiscalYearProvider.dart';
import 'package:bisesh_dairy_udyog_app/Provider/Products.dart';
import 'package:bisesh_dairy_udyog_app/Provider/Units.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  bool isBeginning = true;
  @override
  void didChangeDependencies() {
    if (isBeginning) {
      Provider.of<Products>(context, listen: false).fetchProductFromServer();
      Provider.of<FiscalYearProvider>(context).getActiveFiscalYear();
      Provider.of<ProductUnitProvider>(context).getAllProductUnits();
      Provider.of<BoughtProductProvider>(context).getAllBoughtProductByUserId();
    }
    isBeginning = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var index = Provider.of<Navigations>(context).navigationIndex;
    return index == 0
        ? Home()
        : index == 1
            ? PaymentHistory()
            : index == 2
                ? Summary()
                : Container();
  }
}

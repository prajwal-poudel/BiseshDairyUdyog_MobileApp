import 'dart:convert';

import 'package:bisesh_dairy_udyog_app/utils/ServerLink.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FiscalYear {
  int id;
  String fiscalYear;
  bool current;

  FiscalYear({this.id, this.fiscalYear, this.current});
}

class FiscalYearProvider extends ChangeNotifier {
  FiscalYear _activeFiscalYear;

  FiscalYear get activeFiscalYear {
    return _activeFiscalYear;
  }

  Future getActiveFiscalYear() async {
    var url = Uri.parse("$link/fiscalyear/active");

    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var activeFiscalYear = jsonDecode(response.body);
        print(activeFiscalYear);

        FiscalYear tempHolder;
        tempHolder = FiscalYear(
            id: activeFiscalYear["id"],
            fiscalYear: activeFiscalYear["fiscalYear"],
            current: activeFiscalYear["current"]);

        _activeFiscalYear = tempHolder;
        notifyListeners();
      } else {
        throw "Can't Get Fiscal Year";
      }
    } catch (err) {
      print("=======FiscalYear01");
      print(err);
      print("=======FiscalYear02");
    }
  }
}

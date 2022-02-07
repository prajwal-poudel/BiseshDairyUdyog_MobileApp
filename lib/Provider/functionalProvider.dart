import 'package:flutter/foundation.dart';

class FunctionDetail {
  int id;
  String functionName;
  String functionImage;

  FunctionDetail({this.id, this.functionName, this.functionImage});
}

class FunctionProvider extends ChangeNotifier {
  List<FunctionDetail> _allFunctions = [
    FunctionDetail(
        id: 1,
        functionName: "Bisesh Dairy Udyog",
        functionImage: "assets/images/Amul.png"),
    FunctionDetail(
        id: 2,
        functionName: "Summary",
        functionImage: "assets/images/summary.png"),
    FunctionDetail(
        id: 3,
        functionName: "Products",
        functionImage: "assets/images/products.png"),
    FunctionDetail(
        id: 4,
        functionName: "Blood Donation",
        functionImage: "assets/images/bloodDonation.png"),
    FunctionDetail(
        id: 5,
        functionName: "Social Works",
        functionImage: "assets/images/socialWork.png"),
  ];

  List<FunctionDetail> get allfunctions {
    return [..._allFunctions];
  }
}

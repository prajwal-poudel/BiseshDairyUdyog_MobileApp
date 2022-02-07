import 'package:flutter/foundation.dart';

class Navigations with ChangeNotifier {
  int _navigationIndex = 0;

  int get navigationIndex {
    return _navigationIndex;
  }

  void changeNavigationIndex(int index) {
    _navigationIndex = index;
    notifyListeners();
  }
}

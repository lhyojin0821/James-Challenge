import 'package:flutter/foundation.dart';

class TestProvider with ChangeNotifier {
  int value = 0;
  void add() {
    value++;
    notifyListeners();
  }

  void minus() {
    value--;
    notifyListeners();
  }
}

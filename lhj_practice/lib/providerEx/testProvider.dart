import 'package:flutter/foundation.dart';

class TestProvider with ChangeNotifier {
  int i = 0;

  void add() {
    i++;
    notifyListeners();
    return;
  }
}

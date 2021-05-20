import 'package:flutter/foundation.dart';

class TestProvider with ChangeNotifier {
  int i = 0;

  void add() {
    this.i++;
    this.notifyListeners(); // 다시 그려줌
    return;
  }
}

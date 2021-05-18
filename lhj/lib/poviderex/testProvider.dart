// 로직을 담당하는 클래스
import 'package:flutter/foundation.dart';

class TestProvider with ChangeNotifier {
  int value = 0;
  void add() {
    this.value += 1;
    // setState()
    notifyListeners(); // 다시 그림
  }

  void minus() {
    this.value -= 1;
    this.notifyListeners();
  }
}

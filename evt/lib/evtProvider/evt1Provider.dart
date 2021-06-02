import 'package:flutter/foundation.dart';

class Evt1Provider with ChangeNotifier {
  int i = 0;
  int v = 0;
  int a = 0;
  void addI() {
    i++;
    notifyListeners();
    return;
  }

  void addV() {
    v++;
    notifyListeners();
    return;
  }

  void addA() {
    a++;
    notifyListeners();
    return;
  }
}

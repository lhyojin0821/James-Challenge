import 'package:flutter/foundation.dart';

class Test2Provider with ChangeNotifier {
  int v = 100;

  void minus() {
    this.v--;
    notifyListeners();
    return;
  }
}

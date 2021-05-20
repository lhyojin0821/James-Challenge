import 'package:flutter/foundation.dart';

class Test4Provider with ChangeNotifier {
  bool check = false;

  void checking() {
    this.check = !this.check;
    this.notifyListeners();
    return;
  }
}

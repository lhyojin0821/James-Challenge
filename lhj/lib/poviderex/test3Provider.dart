import 'package:flutter/foundation.dart';

class Test3Provider with ChangeNotifier {
  String s = 'hi';

  void add() {
    this.s += '?';
    this.notifyListeners();
    return;
  }
}

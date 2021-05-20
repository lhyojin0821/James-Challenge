import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class Test3Provider with ChangeNotifier {
  String s = 'hi';
  void add() {
    this.s += '?';
    this.notifyListeners();
    return;
  }
}

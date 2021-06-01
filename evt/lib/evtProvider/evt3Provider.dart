import 'package:flutter/foundation.dart';

class Evt3Provider with ChangeNotifier {
  int i = 0;

  void add() {
    i++;
    notifyListeners();
    return;
  }
}

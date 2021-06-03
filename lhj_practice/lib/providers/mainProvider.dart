import 'package:flutter/foundation.dart';
import 'package:lhj_practice/models/mainConnectModel.dart';
import 'package:lhj_practice/models/mainModel.dart';
import 'package:lhj_practice/repo/connect.dart';

class MainProvider with ChangeNotifier {
  MainConnectModel model;

  MainProvider() {
    Future(this._init);
  }

  Future<void> _init() async {
    this.model = await new Connect().connect();
    notifyListeners();
    return;
  }
}

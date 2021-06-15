import 'package:flutter/foundation.dart';
import 'package:lhj_practice/models/mainConnectModel.dart';
import 'package:lhj_practice/models/mainModel.dart';
import 'package:lhj_practice/repo/connect.dart';

class MainProvider with ChangeNotifier {
  MainConnectModel model;

  MainProvider() {
    Future(this.init);
  }

  Future<void> init() async {
    this.model = await new Connect().connect();
    await new Connect().airTableConnect();
    await new Connect().airTableCreate();
    notifyListeners();
    return;
  }
}

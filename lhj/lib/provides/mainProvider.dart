import 'package:flutter/foundation.dart';
import 'package:lhj/models/mainConnectModel.dart';
import 'package:lhj/models/mainModel.dart';
import 'package:lhj/repo/connect.dart';

class MainProvider with ChangeNotifier {
  // 화면을 그리기전에 동작
  // ->생성자에서 동작을 시켜야줘야 함
  MainConnectModel model;
  // 처음 - null / 성공 - List<MainModel> / 실패 -[]
  // X          /          o           /   ERROR
  // --> 더 다양한 내용으로 값을 체크 해야 함

  //초기화
  MainProvider() {
    Future(this._init);
  }

  Future<void> _init() async {
    this.model = await new Connect().connect();
    notifyListeners();
    return;
  }
}

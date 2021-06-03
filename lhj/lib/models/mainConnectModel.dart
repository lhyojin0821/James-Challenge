import 'package:flutter/foundation.dart';
import 'package:lhj/models/mainModel.dart';

enum NetCheck {
  Ok,
  Error,
  TimeOut,
  ServerError,
}

class MainConnectModel {
  NetCheck netCheck; // 'ok', 'error', 'timeout',....
  List<MainModel> mainModels;

  MainConnectModel({@required this.netCheck, @required this.mainModels});
}

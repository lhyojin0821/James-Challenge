import 'package:flutter/foundation.dart';
import 'package:lhj_practice/models/mainModel.dart';

enum NetCheck {
  Ok,
  Error,
  TimeOut,
  ServerError,
}

class MainConnectModel {
  NetCheck netCheck;
  List<MainModel> mainModels;

  MainConnectModel({@required this.netCheck, @required this.mainModels});
}

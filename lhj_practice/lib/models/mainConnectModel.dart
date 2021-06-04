import 'package:flutter/foundation.dart';
import 'package:lhj_practice/models/mainModel.dart';

enum NetChecks {
  Ok,
  Error,
  TimeOut,
  ServerError,
}

class MainConnectModel {
  NetChecks netCheck;
  List<MainModel> mainModels;

  MainConnectModel({@required this.netCheck, @required this.mainModels});
}

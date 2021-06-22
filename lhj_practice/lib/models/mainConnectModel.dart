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

class AirTableConnectModel {
  NetChecks netChecks;
  AirTableConnectModel({@required this.netChecks});
}

class AirTableCreateConnectModel {
  NetChecks netChecks;
  AirTableCreateConnectModel({@required this.netChecks});
}

class KakaoLoginConnectModel {
  NetChecks netChecks;
  String result;
  KakaoLoginConnectModel({@required this.netChecks, this.result});
}

class LoginConnectModel {
  NetChecks netChecks;
  bool check;
  LoginConnectModel({@required this.netChecks, this.check});
}

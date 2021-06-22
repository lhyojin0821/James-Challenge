import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lhj_practice/models/mainConnectModel.dart';
import 'package:lhj_practice/models/mainModel.dart';

class Connect {
  final String END_POINT = 'http://172.30.1.34:3000';
  Future<MainConnectModel> connect() async {
    try {
      String url = "$END_POINT/flutter/data/all";
      http.Response res = await http.get(url).timeout(Duration(seconds: 8),
          onTimeout: () async => new http.Response('{}', 404));

      if (res.statusCode == 404) {
        return new MainConnectModel(
            netCheck: NetChecks.TimeOut, mainModels: []);
      }
      // print(res.body);
      Map<String, dynamic> result = json.decode(res.body);
      List resultList = result['data'];
      if (resultList == null) {
        return new MainConnectModel(
          netCheck: NetChecks.ServerError,
          mainModels: [],
        );
      }
      return new MainConnectModel(
          netCheck: NetChecks.Ok,
          mainModels: resultList
              .map<MainModel>(
                (dynamic e) => MainModel.fFrom2(ele: e),
              )
              .toList());
    } catch (e) {}
    return new MainConnectModel(netCheck: NetChecks.Error, mainModels: []);
  }

  Future<LoginConnectModel> loginConnect(
      {@required String id, @required String pw}) async {
    try {
      http.Response res = await http
          .post(this.END_POINT + '/flutter/login',
              headers: {'content-type': 'application/json'},
              body: json.encode({'id': id, 'pw': pw}))
          .timeout(Duration(seconds: 8),
              onTimeout: () async => new http.Response('{}', 404));
      if (res.statusCode == 404) {
        return LoginConnectModel(netChecks: NetChecks.TimeOut);
      }

      bool check = jsonDecode(res.body);
      if (check == null) {
        return LoginConnectModel(netChecks: NetChecks.ServerError);
      }
      print(check);
      return LoginConnectModel(netChecks: NetChecks.Ok, check: check);
    } catch (e) {}
    return LoginConnectModel(netChecks: NetChecks.Error);
  }

  Future<AirTableConnectModel> airTableConnect() async {
    try {
      http.Response res = await http.get(
          "https://api.airtable.com/v0/app1X6OfXdB6tWJsL/Table%201?maxRecords=3&view=Grid%20view",
          headers: {
            "Authorization": "Bearer keyLR7h4aI22IPrVZ"
          }).timeout(Duration(seconds: 8),
          onTimeout: () async => new http.Response('{}', 404));
      if (res.statusCode == 404) {
        return AirTableConnectModel(netChecks: NetChecks.TimeOut);
      }
      print(res.body);
    } catch (e) {}
    return AirTableConnectModel(netChecks: NetChecks.Error);
  }

  Future<AirTableCreateConnectModel> airTableCreate() async {
    try {
      http.Response res = await http.post(
          'https://api.airtable.com/v0/app1X6OfXdB6tWJsL/Table%201',
          headers: {
            "Authorization": "Bearer keyLR7h4aI22IPrVZ",
            "Content-Type": "application/json",
          },
          body: '''
      {
  "records": [
    {
      "fields": {
        "Name": "test",
        "Notes": "testtest"
      }
    },
    {
      "fields": {
        "Name": "test",
        "Notes": "testtest"
      }
    }
  ]
}
      ''').timeout(Duration(seconds: 8),
          onTimeout: () async => new http.Response('{}', 404));
      if (res.statusCode == 404) {
        return AirTableCreateConnectModel(netChecks: NetChecks.TimeOut);
      }
      print(res.body);
    } catch (e) {}
    return AirTableCreateConnectModel(netChecks: NetChecks.Error);
  }

  Future<KakaoLoginConnectModel> kakaoLoginKey() async {
    try {
      http.Response res = await http.post(this.END_POINT + '/kakaokey',
          headers: {
            'fkey': 'flutter'
          }).timeout(Duration(seconds: 8),
          onTimeout: () async => new http.Response('{}', 404));
      if (res.statusCode == 404) {
        return KakaoLoginConnectModel(netChecks: NetChecks.TimeOut);
      }
      String result = jsonDecode(res.body);
      if (result == null) {
        return KakaoLoginConnectModel(netChecks: NetChecks.ServerError);
      }
      return KakaoLoginConnectModel(netChecks: NetChecks.Ok, result: result);
    } catch (e) {}
    return KakaoLoginConnectModel(netChecks: NetChecks.Error);
  }
}

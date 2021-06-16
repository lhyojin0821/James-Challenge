import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lhj_practice/models/mainConnectModel.dart';
import 'package:lhj_practice/models/mainModel.dart';

class Connect {
  final String END_POINT = 'http://172.30.1.9:3000';
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

  Future<bool> loginConnect({@required String id, @required String pw}) async {
    http.Response res = await http.post(this.END_POINT + '/flutter/login',
        headers: {'content-type': 'application/json'},
        body: json.encode({'id': id, 'pw': pw}));

    bool check = jsonDecode(res.body);
    print(check);
    return check;
  }

  Future<void> airTableConnect() async {
    http.Response res = await http.get(
        "https://api.airtable.com/v0/app1X6OfXdB6tWJsL/Table%201?maxRecords=3&view=Grid%20view",
        headers: {"Authorization": "Bearer keyLR7h4aI22IPrVZ"});
    print(res.body);
    return;
  }

  Future<void> airTableCreate() async {
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
      ''');
    print(res.body);
    return;
  }
}

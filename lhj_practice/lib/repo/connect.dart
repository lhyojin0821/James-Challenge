import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lhj_practice/models/mainConnectModel.dart';
import 'package:lhj_practice/models/mainModel.dart';

class Connect {
  Future<MainConnectModel> connect() async {
    try {
      String url = "http://172.30.1.16:3000/flutter/data/all";
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
}

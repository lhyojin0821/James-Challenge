import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lhj/models/mainConnectModel.dart';
import 'package:lhj/models/mainModel.dart';

class Connect {
  Future<MainConnectModel> connect() async {
    /// [ error - 예외 처리 ]
    /// 1. 연결 오류 - 서버 종료 되어있다면, 서버주소가 바뀐다면 : try&catch
    /// 2. 연결 지연 - 연결이 불안정한 상태에서 접근하는 경우 : .timeout
    /// 3. 데이터 오류
    // ipv6
    try {
      String url =
          "http://192.168.0.15:3000/flutter/data/all"; // 127.0.0.1 == localhost
      http.Response res = await http.get(url).timeout(Duration(seconds: 8),
          onTimeout: () async => new http.Response('{}', 404)); //200 302

      if (res.statusCode == 404) {
        return new MainConnectModel(netCheck: NetCheck.TimeOut, mainModels: []);
      }
      // print(res.body); // JSON
      // decode <-> encode
      Map<String, dynamic> result =
          json.decode(res.body); // '{}' // [] - try/catch
      List resultList = result['data'];
      if (resultList == null) {
        // print("List is null");
        return new MainConnectModel(
            netCheck: NetCheck.ServerError, mainModels: []);
      }
      return new MainConnectModel(
          netCheck: NetCheck.Ok,
          mainModels: resultList
              .map<MainModel>((dynamic e) => MainModel.fFrom1(ele: e))
              .toList());
    } catch (e) {}
    return new MainConnectModel(netCheck: NetCheck.Error, mainModels: []);
  }
}

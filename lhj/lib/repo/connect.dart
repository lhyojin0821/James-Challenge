import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lhj/models/mainModel.dart';

class Connect {
  Future<List<MainModel>> connect() async {
    /// [ error - 예외 처리 ]
    /// 1. 연결 오류 - 서버 종료 되어있다면, 서버주소가 바뀐다면 : try&catch
    /// 2. 연결 지연 - 연결이 불안정한 상태에서 접근하는 경우 @@ todo
    /// 3. 데이터 오류
    // ipv6
    try {
      String url =
          "http://192.168.0.15:3000/flutter/data/all"; // 127.0.0.1 == localhost
      http.Response res = await http.get(url);
      // print(res.body); // JSON
      // decode <-> encode
      Map<String, dynamic> result = json.decode(res.body);
      List resultList = result['data'];
      return resultList
          .map<MainModel>((dynamic e) => MainModel.fFrom1(ele: e))
          .toList();
    } catch (e) {}
    return [];
  }
}

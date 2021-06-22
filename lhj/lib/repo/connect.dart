import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lhj/models/mainConnectModel.dart';
import 'package:lhj/models/mainModel.dart';

class Connect {
  final String END_POINT = 'http://192.168.0.15:3000';
  Future<MainConnectModel> connect() async {
    /// [ error - 예외 처리 ]
    /// 1. 연결 오류 - 서버 종료 되어있다면, 서버주소가 바뀐다면 : try&catch
    /// 2. 연결 지연 - 연결이 불안정한 상태에서 접근하는 경우 : .timeout
    /// 3. 데이터 오류
    // ipv6
    try {
      String url = "$END_POINT/flutter/data/all"; // 127.0.0.1 == localhost
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

  Future<bool> loginConnect({@required String id, @required String pw}) async {
    http.Response res = await http.post(this.END_POINT + '/flutter/login',
        headers: {"Content-type": "application/json"},
        body: json.encode({"id": id, "pw": pw}) // => '{"id":"dd", "pw":"pwpw"}'
        );

    bool check = json.decode(res.body);
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
          "Content-Type": "application/json"
        },
        body: '''{
  "records": [
    {
      "fields": {
        "Name": "test3",
        "Notes": "testtestsdf"
      }
    },
    {
      "fields": {
        "Name": "test4",
        "Notes": "testtestsdf"
      }
    }
  ]
}''');
    print(res.body);
  }

  Future<String> kakaoLoginKey() async {
    http.Response res = await http
        .post(this.END_POINT + '/kakaokey', headers: {'fkey': 'flutter'});
    String result = jsonDecode(res.body);
    return result;
  }
}

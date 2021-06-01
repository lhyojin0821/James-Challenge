import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lhj_practice/models/mainModel.dart';

class Connect {
  Future<List<MainModel>> connect() async {
    try {
      String url = "http://172.30.1.16:3000/flutter/data/all";
      http.Response res = await http.get(url);
      // print(res.body);
      Map<String, dynamic> result = json.decode(res.body);
      List resultList = result['data'];
      return resultList
          .map<MainModel>(
            (dynamic e) => MainModel.fFrom2(ele: e),
          )
          .toList();
    } catch (e) {}
    return [];
  }
}

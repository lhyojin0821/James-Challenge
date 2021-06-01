import 'package:evt2/models/detailModel.dart';
import 'package:flutter/foundation.dart';

class MainModel {
  String title;
  List<DetailModel> datas;

  MainModel({@required this.title, @required this.datas});

  MainModel.init({@required Map<String, dynamic> ele}) {
    this.title = ele['title'].toString();
    this.datas = List.from(ele['datas']);
  }

  factory MainModel.init2({@required Map<String, dynamic> ele}) {
    return MainModel(
      title: ele['title'].toString(),
      datas: List.from(ele['datas']).map<DetailModel>((dynamic e) {
        return DetailModel.init2(ele: e);
      }).toList(),
    );
  }
}

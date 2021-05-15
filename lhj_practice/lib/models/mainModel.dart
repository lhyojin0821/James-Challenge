import 'package:flutter/foundation.dart';

class MainModel {
  String imgUrl;
  String name;
  List datas;

  MainModel({@required this.imgUrl, @required this.name, @required this.datas});

  MainModel.fFrom1({@required Map<String, dynamic> ele}) {
    this.imgUrl = ele['imgUrl'].toString();
    this.name = ele['name'].toString();
    this.datas = List.from(ele['datas']);
  }
  factory MainModel.fFrom2({@required Map<String, dynamic> ele}) {
    return MainModel(
        imgUrl: ele['imgUrl'].toString(),
        name: ele['name'].toString(),
        datas: List.from(ele['datas']));
  }
}

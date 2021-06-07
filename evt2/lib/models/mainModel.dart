import 'package:flutter/foundation.dart';

class MainModel {
  String title;
  List datas;
  bool isCheck;

  MainModel(
      {@required this.title, @required this.datas, @required this.isCheck});

  MainModel.from({@required Map<String, dynamic> ele}) {
    this.title = ele['title'].toString();
    this.datas = List.from(ele['datas']);
    this.isCheck = ele['isCheck'] ?? false;
  }

  factory MainModel.init({@required Map<String, dynamic> ele}) {
    return MainModel(
        title: ele['title'].toString(),
        isCheck: ele['isCheck'] ?? false,
        datas: List.from(ele['datas']));
  }
}

import 'package:flutter/foundation.dart';

class MainModel {
  String title;
  List datas;
  bool isCheck;

  MainModel(
      {@required this.title, @required this.datas, @required this.isCheck});

  factory MainModel.init({@required Map<String, dynamic> ele}) {
    return MainModel(
        title: ele['title'].toString(),
        isCheck: ele['isCheck'],
        datas: List.from(ele['datas']));
  }
}

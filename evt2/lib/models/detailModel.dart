import 'package:flutter/foundation.dart';

class DetailModel {
  String title;
  List datas;

  DetailModel({@required this.title, @required this.datas});

  DetailModel.init({@required Map<String, dynamic> ele}) {
    this.title = ele['title'].toString();
    this.datas = List.from(ele['datas']);
  }

  factory DetailModel.init2({@required Map<String, dynamic> ele}) {
    return DetailModel(
        title: ele['title'].toString(), datas: List.from(ele['datas']));
  }
}

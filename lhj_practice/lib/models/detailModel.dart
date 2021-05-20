import 'package:flutter/foundation.dart';

class DetailModel {
  String title;
  String name;
  String des;
  String img;

  DetailModel(
      {@required this.title,
      @required this.name,
      @required this.des,
      @required this.img});

  factory DetailModel.init({@required Map<String, dynamic> ele}) {
    return DetailModel(
        title: ele['title'].toString(),
        name: ele['name'].toString(),
        des: ele['des'].toString(),
        img: ele['img'].toString());
  }
}

import 'package:flutter/foundation.dart';

class DetailModel {
  String title;
  String name;
  String des;
  String img;

  DetailModel(
      {@required this.title,
      @required this.name,
      @required des,
      @required this.img});

  factory DetailModel.init({@required Map<String, dynamic> e}) {
    return DetailModel(
        title: e['title'].toString(),
        name: e['name'].toString(),
        des: e['des'].toString(),
        img: e['img'].toString());
  }
}

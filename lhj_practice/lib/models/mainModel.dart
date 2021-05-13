import 'package:flutter/foundation.dart';

class MainModel {
  String imgUrl;
  String name;
  List datas;
  String datas2;
  List datas3;

  MainModel(
      {@required this.imgUrl,
      @required this.name,
      @required this.datas,
      @required this.datas2,
      @required this.datas3});

  MainModel.fFrom1({@required Map<String, dynamic> ele}) {
    this.imgUrl = ele['imgUrl'].toString();
    this.name = ele['name'].toString();
    this.datas = List.from(ele['datas']);
  }

  factory MainModel.fFrom2({@required Map<String, dynamic> ele}) {
    return MainModel(
      imgUrl: ele['imgUrl'].toString(),
      name: ele['name'].toString(),
      datas: List.from(
        ele['datas'],
      ),
      datas2: ele['datas2'].toString(),
      datas3: List.from(ele['datas3']),
    );
  }
}

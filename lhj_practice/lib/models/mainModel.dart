import 'package:flutter/material.dart';
import 'package:lhj_practice/models/detailModel.dart';

class MainModel {
  String imgUrl;
  String name;
  List<DetailModel> datas;
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
        datas: List.from(ele['datas']).map<DetailModel>((dynamic ele) {
          return DetailModel.init(ele: ele);
        }).toList());
  }
}

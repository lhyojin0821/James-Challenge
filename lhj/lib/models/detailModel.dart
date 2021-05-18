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

  factory DetailModel.init({@required Map<String, dynamic> e}) {
    return DetailModel(
      title: e['title'].toString(),
      name: e['name'].toString(),
      des: e['des'].toString(),
      img: e['img'].toString(),
    );
  }
}

// *3번째 페이지 만들면서 참고
// if(model.img == '') return Text();
// return Img()

import 'package:flutter/foundation.dart';
import 'package:lhj/models/detailModel.dart';

// mpa 을 클래스화
class MainModel {
  String imgUrl;
  String name;
  List<DetailModel> datas;

  // new MainModel(...);
  MainModel({
    @required this.imgUrl,
    @required this.name,
    @required this.datas,
  });

  // new MainModel.from(...);
  MainModel.from({@required Map<String, dynamic> ele}) {
    this.imgUrl = ele['imgUrl'].toString();
    this.name = ele['name'].toString();
    this.datas = List.from(ele['datas']);
  }

  // factory method : 함수 -> class  '자기 자신의' 인스턴스를 반환하는 함수
  // * 시스템적으로 인스턴스를 생성 할 때, 기본 생성자들과 차이가 있음(성능 등)
  factory MainModel.fFrom1({@required Map<String, dynamic> ele}) {
    return new MainModel(
        imgUrl: ele['imgUrl'].toString(),
        name: ele['name'].toString(),
        datas: List.from(ele['datas'])
            .map<DetailModel>((dynamic e) => new DetailModel.init(e: e))
            .toList());
  }

  // return new MainModel.from(ele: ele);
  factory MainModel.fFrom2({@required Map<String, dynamic> ele}) {
    return new MainModel.from(ele: ele);
  }
}

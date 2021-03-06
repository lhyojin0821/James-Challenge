import 'package:evt2/models/mainModel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
  // 2차 이벤트 - 데이터 모델링
  // : Map을 class 로 😎
}

class MainPage extends StatelessWidget {
  // -------------- 1 -----------------
  // List<MainModel> models() {
  //   List<MainModel> result = this.data.map<MainModel>((Map<String, dynamic> e) {
  //     return MainModel(
  //         title: e['title'].toString(),
  //         datas: List.from(e['datas']),
  //         isCheck: e['isCheck'] ?? false);
  //   }).toList();
  //   return result;
  // }
  // -------------- 2 -----------------
  // List<MainModel> models() {
  //   List<MainModel> result = this.data.map<MainModel>((Map<String, dynamic> e) {
  //     return MainModel.from(ele: e);
  //   }).toList();
  //   return result;
  // }
  // -------------- 3 -----------------
  List<MainModel> models() {
    List<MainModel> result = this.data.map<MainModel>((Map<String, dynamic> e) {
      return MainModel.init(ele: e);
    }).toList();
    return result;
  }

  List<MainModel> modelViewData;

  MainPage() {
    this.modelViewData = this.models();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: this.modelViewData.length,
          itemBuilder: (BuildContext context, int i) {
            return ListTile(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('title:${this.modelViewData[i].title}'),
                  Text('isCheck:${this.modelViewData[i].isCheck}'),
                  Text(
                      'datas:${this.modelViewData[2].datas[0].datas[0].isCheck}'),
                ],
              ),
            );
          }),
    );
  }

  List<Map<String, dynamic>> data = [
    {
      "title": "A",
      "datas": [
        {"title": "A", "datas": []}
      ]
    },
    {
      "title": "B",
      "datas": [
        {
          "title": "B-1",
          "datas": [
            {"title": "B-2", "datas": []}
          ]
        }
      ]
    },
    {
      "title": "C",
      "datas": [
        {
          "title": "C-1",
          "datas": [
            {"title": "C-2", "datas": []}
          ]
        }
      ]
    },
    {
      "title": "D",
      "isCheck": true,
      "datas": [
        {"title": "D-1", "datas": []}
      ]
    },
    {
      "title": "E",
      "datas": [
        {"title": "E-1", "isCheck": false, "datas": []}
      ]
    },
  ];
}

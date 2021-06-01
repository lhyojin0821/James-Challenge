import 'package:flutter/material.dart';

void main() {
  // 2차 이벤트 - 데이터 모델링
  // : Map을 class 로 😎

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

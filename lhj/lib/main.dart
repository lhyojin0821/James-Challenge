import 'package:flutter/material.dart';

void main() {
  runApp(new MainSys()); //플러터 실행하는 함수
}

// Widget : stl || stf

// -System 단위 1개만
class MainSys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MainPage(),
    );
  }
}

// - page 단위 Scaffold 필요한만큼
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: this._appBar(),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        backgroundColor: Colors.green,
        title: Text('LOGO'),
        // 안드로이드 가운데 정렬
        // centerTitle: true,// Color
        leading: Icon(Icons.http),
        actions: [
          IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () {
              // ....
              return;
            },
          ),
        ],
      );
}

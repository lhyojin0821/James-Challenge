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
      body: new GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        // children: [
        //   this._gridTile(
        //     imgUrl:
        //         'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
        //     name: '홍길동',
        //   ),
        //   this._gridTile(
        //     imgUrl:
        //         'https://images.unsplash.com/photo-1620238669212-cb4942397110?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        //     name: '백두산',
        //   ),
        //   this._gridTile(
        //     imgUrl:
        //         'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
        //     name: '한라산',
        //   ),
        // ],
        // children: this._makeWidgets(this.data),
        itemCount: this.data.length,
        itemBuilder: (BuildContext context, int i) => this._gridTile(
            imgUrl: this.data[i]['imgUrl'], name: this.data[i]['name']),
      ),
    );
  }

  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
      'name': '홍길동'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620238669212-cb4942397110?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '백두산'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
      'name': '한라산'
    }
  ];

  // --> [_gridTile(data[0],_gridTile(data[1],_gridTile(data[2],]

  List<Widget> _makeWidgets(List<Map<String, String>> dataList) {
    // this.data || args -> dataList
    // (1) for문을 사용해서 새로운 배열을 만들기
    // List<Widget> newWidgets = [];
    // for (int i = 0; i < dataList.length; i++) {
    //   newWidgets.add(this
    //       ._gridTile(imgUrl: dataList[i]['imgUrl'], name: dataList[i]['name']));
    // }
    // return newWidgets;
    // (2) List 함수 map() 새로운 배열 <-> forEach() 행위만
    // List<Widget> result = dataList.map<Widget>((Map<String, String> e) {
    //   return this._gridTile(imgUrl: e['imgUrl'], name: e['name']);
    // }).toList();
    // return result;

    return dataList.map<Widget>((Map<String, String> e) {
      return this._gridTile(imgUrl: e['imgUrl'], name: e['name']);
    }).toList();
  }

  PreferredSizeWidget _appBar() => AppBar(
        backgroundColor: Colors.green,
        title: Text('LOGO'),
        // 안드로이드 가운데 정렬
        // centerTitle: true,// Color
        leading: Icon(Icons.menu),
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
  Widget _gridTile(
          {
          // @required BuildContext context,
          @required String imgUrl,
          @required String name}) =>
      Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // width: (MediaQuery.of(context).size.width / 2) - 5.0,
              // height: 20.0,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10.0),
              color: Colors.pink,
              child: Icon(Icons.more_horiz),
            ),
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(60.0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imgUrl),
                ),
              ),
            ),
            Container(
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              color: Colors.purple,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person),
                  Icon(Icons.arrow_circle_up),
                ],
              ),
            ),
          ],
        ),
      );
}

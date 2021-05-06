import 'package:flutter/material.dart';

void main() {
  runApp(MainSys());
}

class MainSys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          // children: [
          // _gridTile(
          //   imgUrl:
          //       'https://images.unsplash.com/photo-1620238748161-64af28ab2d3a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
          //   name: '홍길동',
          // ),
          // _gridTile(
          //     imgUrl:
          //         'https://images.unsplash.com/photo-1620238748497-0b4bd9b922e2?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
          //     name: '백두산'),
          // _gridTile(
          //     imgUrl:
          //         'https://images.unsplash.com/photo-1620238740270-ec79b3534c0e?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
          //     name: '한라산'),
          // ],
          // children: this._makeWidgets(),
          itemCount: this.data.length,
          itemBuilder: (BuildContext context, int i) => this._gridTile(
              imgUrl: this.data[i]['imgUrl'], name: this.data[i]['name'])),
    );
  }

  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620238748161-64af28ab2d3a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '홍길동'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620238748497-0b4bd9b922e2?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '한라산'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620238740270-ec79b3534c0e?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '한라산'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620221909406-02ca086acd4d?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '임효진'
    }
  ];

  // List<Widget> _makeWidgets() {
  //   return this.data.map<Widget>((Map<String, String> e) {
  //     return _gridTile(imgUrl: e['imgUrl'], name: e['name']);
  //   }).toList();
  // return dataList.map<Widget>((Map<String, String> e) {
  //   return _gridTile(imgUrl: e['imgUrl'], name: e['name']);
  // }).toList();
  // }
  //   List<Widget> newWidgets = [];
  //   for (int i = 0; i < this.data.length; i++) {
  //     newWidgets.add(this._gridTile(
  //         imgUrl: this.data[i]['imgUrl'], name: this.data[i]['name']));
  //   }
  //   return newWidgets;
  // }
  // List<Widget> _makeWidgets(List<Map<String, String>> dataList) {
  //   List<Widget> newWidgets = [];
  //   for (int i = 0; i < dataList.length; i++) {
  //     newWidgets.add(this
  //         ._gridTile(imgUrl: dataList[i]['imgUrl'], name: dataList[i]['name']));
  //   }
  //   return newWidgets;
  // }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text('LOGO'),
      leading: Icon(Icons.menu),
      actions: [
        IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              return;
            }),
      ],
    );
  }

  Widget _gridTile({@required String imgUrl, @required String name}) =>
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
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
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

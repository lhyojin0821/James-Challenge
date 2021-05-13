import 'package:flutter/material.dart';
import 'package:lhj_practice/models/mainModel.dart';
import 'package:lhj_practice/pageTwo.dart';

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
  // List<MainModel> transModel() {
  //   List<MainModel> result2 =
  //       this.vData.map<MainModel>((Map<String, dynamic> e) {
  //     return MainModel(
  //         imgUrl: e['imgUrl'].toString(),
  //         name: e['name'].toString(),
  //         datas: List.from(e['datas']));
  //   }).toList();
  //   return result2;
  // }
  // List<MainModel> transModel() {
  //   List<MainModel> result = this.vData.map((Map<String, dynamic> e) {
  //     return MainModel.fFrom1(ele: e);
  //   }).toList();
  //   return result;
// }
  List<MainModel> transModel() {
    List<MainModel> result = this.vData.map((Map<String, dynamic> e) {
      return MainModel.fFrom2(ele: e);
    }).toList();
    return result;
  }

  List<MainModel> modelViewData;

  MainPage() {
    modelViewData = transModel();
  }
  @override
  Widget build(BuildContext context) {
    // List<MainModel> result1 =
    //     this.vData.map<MainModel>((Map<String, dynamic> e) {
    //   return MainModel(
    //       imgUrl: e['imgUrl'].toString(),
    //       name: e['name'].toString(),
    //       datas: List.from(e['datas']));
    // }).toList();
    // print('1: $result1');
    print('2: $modelViewData');
    return Scaffold(
      appBar: _appBar(),
      body: GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: modelViewData.length,
        itemBuilder: (BuildContext context, int i) {
          return _gridTile(
              value: i,
              context: context,
              imgUrl: modelViewData[i].imgUrl,
              name: modelViewData[i].name);
        },
        // children: _makeWidgets(),
      ),
    );
  }

  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620823921330-cdae9bbf5fc0?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'EDM'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620822569081-a5498235d54d?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'POP'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620550737666-ff0b70d74fe4?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2NHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'K-POP'
    },
  ];
  List<Map<String, dynamic>> vData = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620823921330-cdae9bbf5fc0?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'EDM',
      'datas': [1, 2, 3, 4],
      'datas2': 'a',
      'datas3': [
        {'a': 1},
        {'a1': 2}
      ]
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620822569081-a5498235d54d?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzNnx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'POP',
      'datas': [5, 6, 7],
      'datas2': 'b',
      'datas3': [
        {'a2': 3},
        {'a3': 4}
      ]
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620550737666-ff0b70d74fe4?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw2NHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'K-POP',
      'datas': [8, 9],
      'datas2': 'c',
      'datas3': [
        {'a4': 5},
        {'a5': 6}
      ]
    },
  ];

  // List<Widget> _makeWidgets() {
  //   List<Widget> newWidgets = [];
  //   for (int i = 0; i < this.data.length; i++) {
  //     newWidgets.add(_girdTile(
  //         imgUrl: this.data[i]['imgUrl'], name: this.data[i]['name']));
  //   }
  //   return newWidgets;
  // }
  // List<Widget> _makeWidgets() {
  //   return this.data.map<Widget>((Map<String, String> e) {
  //     return _gridTile(imgUrl: e['imgUrl'], name: e['name']);
  //   }).toList();
  // }

  Widget _gridTile({
    @required String imgUrl,
    @required String name,
    @required BuildContext context,
    @required int value,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return PageTwo(
              datas3: this.modelViewData[value].datas3,
              datas2: this.modelViewData[value].datas2,
              datas: this.modelViewData[value].datas,
              // datas: this.vData[value]['datas'],
              name: name,
              value: (() {
                // List<int> l = this.data.map<int>((Map<String, String> e) {
                //   if (e['name'] == name) {
                //     return this.data.indexOf(e);
                //   }
                //   return null;
                // }).toList();
                // print(l);
                // List<int> r = l.where((element) {
                //   if (element != null) {
                //     return true;
                //   }
                //   return false;
                // }).toList();
                // print(r);
                int t = this
                    .vData
                    .map<int>((Map<String, dynamic> e) {
                      if (e['name'] == name) {
                        return this.vData.indexOf(e);
                      }
                      return null;
                    })
                    .toList()
                    .where((element) {
                      if (element != null) {
                        return true;
                      }
                      return false;
                    })
                    .toList()[0];
                return t;
              })());
        }));
      },
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10.0),
              alignment: Alignment.centerRight,
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
                      fit: BoxFit.cover, image: NetworkImage(imgUrl))),
            ),
            Container(
              child: Text(
                name,
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
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
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text('LOGO'),
      leading: Icon(Icons.menu),
      actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
    );
  }
}

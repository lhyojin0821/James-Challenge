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
  List<MainModel> transModel() {
    List<MainModel> result =
        this.vData.map<MainModel>((Map<String, dynamic> e) {
      // return MainModel(
      //   imgUrl: e['imgUrl'].toString(),
      //   name: e['name'].toString(),
      //   datas: List.from(e['datas']),
      // );
      // return MainModel.fForm1(ele: e);
      return MainModel.fFrom2(ele: e);
    }).toList();
    return result;
  }

  List<MainModel> modelViewData;
  MainPage() {
    this.modelViewData = transModel();
  }

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
        itemCount: this.modelViewData.length,
        itemBuilder: (BuildContext context, int i) {
          return _gridTile(
              value: i,
              context: context,
              imgUrl: this.modelViewData[i].imgUrl,
              name: this.modelViewData[i].name);
        },
      ),
    );
  }

  List<Map<String, dynamic>> vData = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1621135177072-57c9b6242e7a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'EDM',
      'datas': [1, 2, 3, 4]
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1595909336425-5bf541155dec?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'POP',
      'datas': [5, 6, 7]
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1612899329140-7f16de31c54f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'K-POP',
      'datas': [8, 9]
    },
  ];
  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1621135177072-57c9b6242e7a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'EDM'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1595909336425-5bf541155dec?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'POP'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1612899329140-7f16de31c54f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'K-POP'
    },
  ];
  // List<Widget> _makeWidgets() {
  //   List<Widget> newWidgets = [];
  //   for (int i = 0; i < this.data.length; i++) {
  //     newWidgets.add(_gridTile(
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
              datas: this.modelViewData[value].datas,
              // datas: this.vData[value]['datas'],
              name: name,
              value: (() {
                int t = this
                    .data
                    .map<int>((Map<String, String> e) {
                      if (e['name'] == name) {
                        return this.data.indexOf(e);
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
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            Container(
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

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text('LOGO'),
      leading: Icon(Icons.menu),
      actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
    );
  }
}

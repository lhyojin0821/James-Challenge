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
    // List<MainModel> result =
    //     this.vData.map<MainModel>((Map<String, dynamic> ele) {
    //   return new MainModel(
    //       imgUrl: ele['imgUrl'].toString(),
    //       name: ele['name'].toString(),
    //       datas: List.from(ele['datas']));
    // }).toList();
    // List<MainModel> result =
    //     this.vData.map<MainModel>((Map<String, dynamic> element) {
    //   return new MainModel.fFrom(ele: element);
    // }).toList();
    // return result;
    // List<MainModel> result =
    //     this.vData.map<MainModel>((Map<String, dynamic> element) {
    //   return new MainModel.fFrom(ele: element);
    // }).toList();
    // return result;
    List<MainModel> result =
        this.vData.map<MainModel>((Map<String, dynamic> element) {
      return new MainModel.fFrom2(ele2: element);
    }).toList();
    return result;
  }

  List<MainModel> modelViewData;

  MainPage() {
    this.modelViewData = transModel();
  }

  @override
  Widget build(BuildContext context) {
    // 1
    // List<MainModel> result =
    //     this.vData.map<MainModel>((Map<String, dynamic> ele) {
    //   return new MainModel(
    //       imgUrl: ele['imgUrl'].toString(),
    //       name: ele['name'].toString(),
    //       datas: List.from(ele['datas']));
    // }).toList();
    // print(result);
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

  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620800390262-00f3ff478212?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'EDM'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1585399000684-d2f72660f092?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'POP'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620704087652-f4f843f04e6b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
      'name': 'K-POP'
    },
  ];
  List<Map<String, dynamic>> vData = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620800390262-00f3ff478212?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxN3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'EDM',
      'datas': [1, 2, 3, 4]
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1585399000684-d2f72660f092?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyNXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'POP',
      'datas': [5, 6],
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620704087652-f4f843f04e6b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
      'name': 'K-POP',
      'datas': [7, 8],
    },
  ];

  // List<Widget> _makeWidgets() {
  //   return this.data.map((Map<String, String> e) {
  //     return _gridTile(imgUrl: e['imgUrl'], name: e['name']);
  //   }).toList();
  // List<Widget> newWidgets = [];
  // for (int i = 0; i < this.data.length; i++) {
  //   newWidgets.add(_gridTile(
  //       imgUrl: this.data[i]['imgUrl'], name: this.data[i]['name']));
  // }
  // return newWidgets;
  // }

  Widget _gridTile({
    @required int value,
    @required BuildContext context,
    @required String imgUrl,
    @required String name,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return PageTwo(
              // datas: List.from(this.vData[value]['datas']),
              datas: this.modelViewData[value].datas,
              name: name,
              value: (() {
                // List<int> l = this.data.map((Map<String, String> e) {
                //   if (e['name'] == name) {
                //     return this.data.indexOf(e);
                //   }
                //   return null;
                // }).toList();
                // List<int> r = l.where((element) {
                //   if (element != null) {
                //     return true;
                //   }
                //   return false;
                // }).toList();
                int t = ((this.data.map((Map<String, String> e) {
                  if (e['name'] == name) {
                    return this.data.indexOf(e);
                  }
                  return null;
                }).toList())
                    .where((element) {
                  if (element != null) {
                    return true;
                  }
                  return false;
                }).toList()[0]);
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
                  borderRadius: BorderRadius.circular(60.0),
                  color: Colors.yellow,
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

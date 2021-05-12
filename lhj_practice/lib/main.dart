import 'package:flutter/material.dart';
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
        itemCount: this.data.length,
        itemBuilder: (BuildContext context, int i) {
          return _gridTile(
              value: i,
              context: context,
              imgUrl: this.data[i]['imgUrl'],
              name: this.data[i]['name']);
        },
      ),
    );
  }

  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620753980628-e3813ec46b41?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'EDM'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620704087652-f4f843f04e6b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80',
      'name': 'POP'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620757482070-4994c580db7a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'K-POP'
    },
  ];

  // List<Widget> _makeWidgets(List<Map<String, String>> dataList) {
  //   return this.data.map<Widget>((Map<String, String> e) {
  //     return _gridTile(imgUrl: e['imgUrl'], name: e['name']);
  //   }).toList();
  // List<Widget> newWidgets = [];
  // for (int i = 0; i < dataList.length; i++) {
  //   newWidgets.add(
  //       _gridTile(imgUrl: dataList[i]['imgUrl'], name: dataList[i]['name']));
  // }
  // return newWidgets;
  // }

  Widget _gridTile({
    @required BuildContext context,
    @required String imgUrl,
    @required String name,
    @required int value,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return PageTwo(
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
                int t = ((this.data.map<int>((Map<String, String> e) {
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
                }).toList())[0];
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
              // width: MediaQuery.of(context).size.width,
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

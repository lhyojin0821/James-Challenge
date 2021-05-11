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
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        // children: [
        //   _gridTile(
        //     imgUrl: this.data[0]['imgUrl'],
        //     name: this.data[0]['name'],
        //   ),
        //   _gridTile(
        //     imgUrl: this.data[1]['imgUrl'],
        //     name: this.data[1]['name'],
        //   ),
        //   _gridTile(
        //     imgUrl: this.data[2]['imgUrl'],
        //     name: this.data[2]['name'],
        //   ),
        // ],
        // children: _makeWidgets(this.data),
        itemCount: this.data.length,
        itemBuilder: (BuildContext context, int i) {
          return _gridTile(
            imgUrl: this.data[i]['imgUrl'],
            name: this.data[i]['name'],
            context: context,
            value: i,
          );
        },
      ),
    );
  }

  List<Widget> _makeWidgets(List<Map<String, String>> dataList) {
    // return dataList.map((Map<String, String> e) {
    //   return _gridTile(imgUrl: e['imgUrl'], name: e['name']);
    // }).toList();
    // List<Widget> newWidgets = [];
    // for (int i = 0; i < dataList.length; i++) {
    //   newWidgets.add(
    //       _gridTile(imgUrl: dataList[i]['imgUrl'], name: dataList[i]['name']));
    // }
    // return newWidgets;
  }

  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NDN8fG11c2ljfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'EDM'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1493225457124-a3eb161ffa5f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fG11c2ljfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'POP'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1504898770365-14faca6a7320?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzB8fG11c2ljfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'HiP HOP'
    },
  ];

  Widget _gridTile(
      {@required BuildContext context,
      @required String imgUrl,
      @required String name,
      @required int value}) {
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
                    .where((int element) {
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
      ),
    );
  }

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
            })
      ],
    );
  }
}

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
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        // children: [
        //   _gridTile(
        //       imgUrl:
        //           'https://s3.ap-south-1.amazonaws.com/www.kreately.in/wp-content/uploads/2020/11/29215616/3-1-6.jpg',
        //       name: 'EDM'),
        //   _gridTile(
        //       imgUrl:
        //           'https://images.unsplash.com/photo-1421217336522-861978fdf33a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fG11c2ljfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
        //       name: 'POP'),
        //   _gridTile(
        //       imgUrl:
        //           'https://i1.sndcdn.com/artworks-000453440922-qo4j1g-t500x500.jpg',
        //       name: 'HIP HOP'),
        // ],
        // children: _makeWidgets(this.data),
        itemCount: this.data.length,
        itemBuilder: (BuildContext context, int i) {
          return _gridTile(
              imgUrl: this.data[i]['imgUrl'], name: this.data[i]['name']);
        },
      ),
    );
  }

  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://s3.ap-south-1.amazonaws.com/www.kreately.in/wp-content/uploads/2020/11/29215616/3-1-6.jpg',
      'name': 'EDM'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1421217336522-861978fdf33a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjJ8fG11c2ljfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'POP'
    },
    {
      'imgUrl':
          'https://i1.sndcdn.com/artworks-000453440922-qo4j1g-t500x500.jpg',
      'name': 'HIP HOP'
    },
  ];

  // List<Widget> _makeWidgets(List<Map<String, String>> dataList) {
  //   // List<Widget> _newWidgets = [];
  //   // for (int i = 0; i < dataList.length; i++) {
  //   //   _newWidgets.add(
  //   //       _gridTile(imgUrl: dataList[i]['imgUrl'], name: dataList[i]['name']));
  //   // }
  //   // return _newWidgets;
  //   return dataList.map<Widget>((Map<String, String> e) {
  //     return _gridTile(imgUrl: e['imgUrl'], name: e['name']);
  //   }).toList();
  // }
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
          }),
    ],
  );
}

Widget _gridTile({
  @required String imgUrl,
  @required String name,
}) {
  return Container(
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

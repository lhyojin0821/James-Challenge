import 'package:flutter/material.dart';
import 'package:widgets/secondPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AppBar',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.red[200],
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
                    ),
                  ),
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.5, 0.5),
                    ),
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.5, 0.5),
                    ),
                  ]),
            ),
            Container(
              child: Text('스크롤 시작'),
            ),
            Container(
              color: Colors.red,
              height: 1000.0,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return SecondPage();
                  }),
                );
              },
              child: Container(
                child: Text('스크롤 끝'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            label: 'menu',
            icon: Icon(Icons.menu),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            label: 'setting',
            icon: Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}

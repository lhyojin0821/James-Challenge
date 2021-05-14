import 'package:flutter/material.dart';
import 'package:widget2/pageViewPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTime'),
      ),
      body: Column(
        children: [
          Text(
            new DateTime.now().toString(),
          ),
          Text(new DateTime.now().year.toString()),
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return PageViewPage();
              }));
            },
            child: Text(
              '다음페이지',
              style: TextStyle(fontSize: 30.0),
            ),
          )
        ],
      ),
    );
  }
}

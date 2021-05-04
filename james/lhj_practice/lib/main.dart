import 'package:flutter/material.dart';

void main() => runApp(MainSys());

class MainSys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _gridView(),
    );
  }
}

PreferredSizeWidget _appBar() => new AppBar(
      backgroundColor: Colors.green,
      title: new Text('LOGO'),
      leading: new Icon(
        Icons.menu,
      ),
      actions: [
        new Icon(Icons.settings),
      ],
    );

GridView _gridView() => GridView(
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      children: [
        new Container(
          color: Colors.red,
        ),
        new Container(
          color: Colors.blue,
        ),
        new Container(
          color: Colors.yellow,
        ),
      ],
    );

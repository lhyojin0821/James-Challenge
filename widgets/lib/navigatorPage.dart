import 'package:flutter/material.dart';

class NavigatorPage extends StatefulWidget {
  String data;
  NavigatorPage({@required this.data});

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(this.widget.data.toString()),
            ),
            GestureDetector(
                child: Text('뒤로이동'),
                onTap: () {
                  Navigator.of(context).pop('backValue');
                })
          ],
        ),
      ),
    );
  }
}

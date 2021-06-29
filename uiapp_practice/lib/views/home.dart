import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  List<Map<String, String>> data = [
    {'imgUrl': '', 'name': ''},
    {'imgUrl': '', 'name': ''},
    {'imgUrl': '', 'name': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.red,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            this._title(title: 'Title', fontSize: 16.0),
            this._topBanner(),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget _title({required String title, required double fontSize}) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20.0),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
      );
  Widget _topBanner() => Container(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: data.map<Widget>((Map<String, String> e) => Text('Select ${this.data.indexOf(e)}')).toList()));
}

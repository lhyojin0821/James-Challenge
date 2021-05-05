import 'package:flutter/material.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Builder'),
      ),
      body: Container(
        child: ListView.builder(
          padding: EdgeInsets.all(10.0),
          itemCount: 5,
          itemBuilder: (context, int index) {
            return Container(
              padding: EdgeInsets.all(10.0),
              child: Text('ListViewBuilder${(index + 1).toString()}'),
            );
          },
        ),
      ),
    );
  }
}

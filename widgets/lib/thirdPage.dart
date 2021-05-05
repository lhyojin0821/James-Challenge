import 'package:flutter/material.dart';
import 'package:widgets/fourthPage.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View'),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('ListView1'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('ListView2'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('ListView3'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('ListView4'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text('ListView5'),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) {
                      return FourthPage();
                    }),
                  );
                },
                child: Icon(Icons.arrow_forward)),
          ],
        ),
      ),
    );
  }
}

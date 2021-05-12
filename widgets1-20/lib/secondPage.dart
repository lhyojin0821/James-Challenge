import 'package:flutter/material.dart';
import 'package:widgets/thirdPage.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column & Low'),
      ),
      body: Column(
        children: [
          Text('C'),
          Text('O'),
          Text('L'),
          Text('U'),
          Text('M'),
          Text('N'),
          Row(
            children: [
              Text('R'),
              Text('O'),
              Text('W'),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return ThirdPage();
                }),
              );
            },
            child: Center(
              child: Icon(
                Icons.arrow_forward,
                size: 50.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

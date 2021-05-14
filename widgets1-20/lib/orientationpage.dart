import 'package:flutter/material.dart';
import 'package:widgets/camera.dart';

class OrientationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrientationPage'),
      ),
      body: Column(
        children: [
          Center(
            child: OrientationBuilder(
              builder: (BuildContext context, orientation) {
                return Text('화면 감지 ${orientation.toString()}');
              },
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return Camera();
                }));
              },
              child: Container(
                child: Text(
                  '다음페이지',
                  style: TextStyle(fontSize: 30.0),
                ),
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OrientationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OrientationPage'),
      ),
      body: Center(
        child: OrientationBuilder(
          builder: (BuildContext context, orientation) {
            return Text('화면 감지 ${orientation.toString()}');
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class BottomSheetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bottomsheet'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              child: Text(
                'sheet1',
                style: TextStyle(fontSize: 30.0),
              ),
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Column(
                          children: [
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                '닫기',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            Text('bottomsheet notification1'),
                          ],
                        ),
                      );
                    });
              },
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Share.share('Title',
                    subject: 'subTitle', sharePositionOrigin: Rect.zero);
              },
              child: Text(
                '공유',
                style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

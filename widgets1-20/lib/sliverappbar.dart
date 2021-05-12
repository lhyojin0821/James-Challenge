import 'package:flutter/material.dart';
import 'package:widgets/notification.dart';
import 'package:widgets/youtube.dart';

class SliverAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Text('CustomScroll & SliverAppBar'),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int i) {
              return Container(
                margin: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 16.0,
                ),
                child: Text('ListItem $i'),
              );
            },
            childCount: 5,
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int i) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return YoutubePage();
                  }));
                },
                child: Container(
                  child: Center(
                    child: Text('Item $i'),
                  ),
                ),
              );
            },
            childCount: 5,
          ),
        )
      ],
    ));
  }
}

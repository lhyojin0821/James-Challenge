import 'package:flutter/material.dart';
import 'package:widgets/widget_application.dart';

class GridViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GridView'),
      ),
      body: Container(
        child: GridView.builder(
          padding: EdgeInsets.all(10.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemCount: 6,
          itemBuilder: (BuildContext context, int i) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return WidgetApplication();
                  }),
                );
              },
              child: Container(
                color: Colors.grey[300],
                child: Center(
                  child: Text('GridView${(i + 1).toString()}'),
                ),
              ),
            );
          },
          // children: [
          //   Container(
          //     color: Colors.grey[300],
          //     child: Center(child: Text('GridView1')),
          //   ),
          //   Container(
          //     color: Colors.grey[300],
          //     child: Center(child: Text('GridView2')),
          //   ),
          //   Container(
          //     color: Colors.grey[300],
          //     child: Center(child: Text('GridView3')),
          //   ),
          //   Container(
          //     color: Colors.grey[300],
          //     child: Center(child: Text('GridView4')),
          //   ),
          // ],
        ),
      ),
    );
  }
}

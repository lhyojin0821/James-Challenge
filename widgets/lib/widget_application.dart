import 'package:flutter/material.dart';
import 'package:widgets/buttonWidget.dart';

class WidgetApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: Text('ListView'),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150.0,
                child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      width: 145.0,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.grey[300],
                      child: Center(
                        child: Text('ListView${i + 1}'),
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(5.0),
                child: Text('GridView'),
              ),
              Container(
                height: 300.0,
                child: GridView.builder(
                  padding: EdgeInsets.all(5.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 12.0,
                  ),
                  itemCount: 12,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      color: Colors.grey[300],
                      child: Center(
                        child: Text('GridView${i + 1}'),
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (BuildContext context) {
                      return ButtonWidget();
                    }),
                  );
                },
                child: Container(
                  color: Colors.blue[200],
                  margin: EdgeInsets.all(5.0),
                  height: 500.0,
                  child: Center(
                    child: Text(
                      'Contents',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

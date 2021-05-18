import 'package:flutter/material.dart';
import 'package:lhj/poviderex/test2Page.dart';
import 'package:lhj/poviderex/testProvider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  // 1. 숫자담을 변수
  // 2. 누르면 숫자를 증가할 로직

  @override
  Widget build(BuildContext context) {
    // TestProvider provider = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.build),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ChangeNotifierProvider<TestProvider>(
                          create: (BuildContext context) => new TestProvider(),
                          child: new Test2Page())),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text("provider.value.toString()"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        // onPressed: () => provider.add(),
      ),
    );
  }
}

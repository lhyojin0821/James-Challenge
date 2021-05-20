import 'package:flutter/material.dart';
import 'package:lhj_practice/providerEx/test2Page.dart';
import 'package:lhj_practice/providerEx/testProvider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestProvider provider = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.build),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) =>
                    ChangeNotifierProvider<TestProvider>(
                  create: (BuildContext context) => TestProvider(),
                  child: Test2Page(provider),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(provider.value.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => provider.add(),
      ),
    );
  }
}

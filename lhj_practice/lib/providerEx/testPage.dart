import 'package:flutter/material.dart';
import 'package:lhj_practice/providerEx/testProvider.dart';
import 'package:provider/provider.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestProvider provider = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(),
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

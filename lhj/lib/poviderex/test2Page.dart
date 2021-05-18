import 'package:flutter/material.dart';
import 'package:lhj/poviderex/testProvider.dart';
import 'package:provider/provider.dart';

class Test2Page extends StatelessWidget {
  // TestProvider provider;
  // Test2Page(this.provider);
  @override
  Widget build(BuildContext context) {
    TestProvider provider = Provider.of<TestProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.value.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exposure_minus_1),
        onPressed: () => provider.minus(),
      ),
    );
  }
}

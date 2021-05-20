import 'package:flutter/material.dart';
import 'package:lhj/poviderex/test2Provider.dart';
import 'package:lhj/poviderex/test3Provider.dart';
import 'package:lhj/poviderex/testProvider.dart';
import 'package:provider/provider.dart';

class Test2Page extends StatelessWidget {
  Test2Provider tprovider;
  Test2Page(this.tprovider);
  @override
  Widget build(BuildContext context) {
    TestProvider provider = Provider.of<TestProvider>(context);
    Test3Provider provider3 = Provider.of<Test3Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(provider.i.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          provider3.add();
        },
      ),
      body: Column(
        children: [
          Text(provider3.s),
          Row(
            children: [
              Text(this.tprovider.v.toString()),
              IconButton(
                  icon: Icon(Icons.exposure_minus_1),
                  onPressed: () {
                    this.tprovider.minus();
                  })
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lhj_practice/providerEx/test2Page.dart';
import 'package:lhj_practice/providerEx/test2Provider.dart';
import 'package:lhj_practice/providerEx/test3Provider.dart';
import 'package:lhj_practice/providerEx/test4Provider.dart';
import 'package:provider/provider.dart';
import 'package:lhj_practice/providerEx/testProvider.dart';

class TestPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TestProvider provider = Provider.of<TestProvider>(context);
    Test2Provider provider2 = Provider.of<Test2Provider>(context);
    Test4Provider provider4 = Provider.of<Test4Provider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ChangeNotifierProvider<Test3Provider>(
                    create: (BuildContext context) => Test3Provider(),
                    child: Test2Page(provider2));
              }));
            },
          )
        ],
      ),
      body: Column(
        children: [
          Text(provider.i.toString()),
          Row(
            children: [
              Text(provider2.v.toString()),
              IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    provider2.minus();
                  }),
              TextButton(
                  onPressed: () {
                    provider4.checking();
                  },
                  child: Text(
                    'check',
                    style: TextStyle(
                      color: provider4.check ? Colors.black : Colors.red,
                    ),
                  )),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          provider.add();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

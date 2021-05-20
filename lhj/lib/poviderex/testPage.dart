import 'package:flutter/material.dart';
import 'package:lhj/poviderex/test2Page.dart';
import 'package:lhj/poviderex/test2Provider.dart';
import 'package:lhj/poviderex/test3Provider.dart';
import 'package:lhj/poviderex/test4Provider.dart';
import 'package:lhj/poviderex/testProvider.dart';
import 'package:provider/provider.dart';

//Provider : stf 사용하면 UI + Logic 같이 사용
// Stl - UI / Provider - Logic
// 복잡할수록 좋음
// stf * 내장 된 시점 코드가 많음 - init, did, dispose ...

// 버튼을 누르면 화면에 숫자 변경
//
class TestPage extends StatelessWidget {
  // 화면에 숫자를 보여줄 변수, "상태" 변수 -> Provider

  // 버튼 이벤트 함수 / 메서드, 상태 변수를 증가, 화면을 다시 그리도록

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
                    create: (BuildContext context) => new Test3Provider(),
                    child: Test2Page(provider2));
              }));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Text(provider.i.toString()),
          Row(
            children: [
              Text(provider2.v.toString()),
              IconButton(
                  icon: Icon(Icons.exposure_minus_1),
                  onPressed: () {
                    provider2.minus();
                  }),
              TextButton(
                onPressed: () {
                  provider4.checking();
                },
                child: Text(
                  'CHECK',
                  style: TextStyle(
                      color: provider4.check ? Colors.black : Colors.red),
                ),
              )
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          provider.add();
        },
      ),
    );
  }
}

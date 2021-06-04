import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
    ], child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageWidget());
  }
}

class Counter with ChangeNotifier {
  int _secCount = 1;
  int _backCount = 1;
  int _reverseCount = 1;

  int get secCount => _secCount;
  int get backCount => _backCount;
  int get reverseCount => _reverseCount;

  set secCount(int i) {
    this._secCount = i;
    notifyListeners();
  }

  set backCount(int i) {
    this._backCount = i;
    notifyListeners();
  }

  set reverseCount(int i) {
    this._reverseCount = i;
    notifyListeners();
  }

  void reverseAdd(int i) {
    this.reverseCount += i;
  }
}

class PageWidget extends StatefulWidget {
  @override
  _PageWidgetState createState() => _PageWidgetState();
}

class _PageWidgetState extends State<PageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("제어를 위한 기본 문제")),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              Container(
                padding: EdgeInsets.all(5.0),
                child: Text("* 변경은 숫자의 증가", style: TextStyle(fontSize: 12.0)),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Column(children: [
                    Text("[같은 레벨], FirWidget 클릭 할 때, SecWidget 의 값을 변경하려면 ?"),
                    FirWidget(),
                    SecWidget()
                  ])),
              SizedBox(
                height: 50.0,
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Column(children: [
                    Text("[하위 레벨] FontWidget 클릭 할 때, BackWidget 의 값을 변경하려면 ?"),
                    BackWidget(child: FrontWidget())
                  ])),
              SizedBox(
                height: 50.0,
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Column(children: [
                    Text(
                        "[상위 레벨], NomalWidget 클릭 할 때, ReverseWidget 의 값을 변경하려면 ?"),
                    NomalWidget(child: ReverseWidget())
                  ]))
            ]),
          ),
        ));
  }
}

class FirWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter c = Provider.of<Counter>(context);
    return TextButton(
        child: Text("FirWidget"),
        onPressed: () {
          c.secCount += 1;
        });
  }
}

class SecWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter c = Provider.of<Counter>(context);
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Text("SecWidget : ${c.secCount}"));
  }
}

class BackWidget extends StatelessWidget {
  final Widget child;
  const BackWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    Counter c = Provider.of<Counter>(context);
    return Container(
        child: Column(children: [
      Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Text("BackWidget : ${c.backCount}")),
      Container(padding: EdgeInsets.only(left: 20.0), child: child)
    ]));
  }
}

class FrontWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter c = Provider.of<Counter>(context);
    return TextButton(
        child: Text("FrontWidget"),
        onPressed: () {
          c.backCount += 1;
        });
  }
}

class NomalWidget extends StatelessWidget {
  final Widget child;
  const NomalWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    Counter c = Provider.of<Counter>(context);
    return Container(
        child: Column(children: [
      TextButton(
          child: Text("NomalWidget"),
          onPressed: () {
            c.reverseCount += 1;
          }),
      Container(padding: EdgeInsets.only(left: 20.0), child: child)
    ]));
  }
}

class ReverseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Counter c = Provider.of<Counter>(context);
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Text("ReverseWidget : ${c.reverseCount}"));
  }
}

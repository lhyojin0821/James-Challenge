import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Data {
  static int data = 0;
  static int data2 = 0;
  static int data3 = 0;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PageWidget());
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
                    FirWidget(
                      func: () {
                        setState(() {
                          Data.data++;
                        });
                      },
                    ),
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
                    BackWidget(child: FrontWidget(
                      func: () {
                        setState(() {
                          Data.data2++;
                        });
                      },
                    ))
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
                    NomalWidget(
                        func: () {
                          setState(() {
                            Data.data3++;
                          });
                        },
                        child: ReverseWidget())
                  ]))
            ]),
          ),
        ));
  }
}

class FirWidget extends StatelessWidget {
  void Function() func;
  FirWidget({@required this.func});
  @override
  Widget build(BuildContext context) {
    return TextButton(child: Text("FirWidget"), onPressed: this.func);
  }
}

class SecWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Text("SecWidget : ${Data.data}"));
  }
}

class BackWidget extends StatelessWidget {
  final Widget child;
  const BackWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Text("BackWidget : ${Data.data2}")),
      Container(padding: EdgeInsets.only(left: 20.0), child: child)
    ]));
  }
}

class FrontWidget extends StatelessWidget {
  void Function() func;
  FrontWidget({@required this.func});
  @override
  Widget build(BuildContext context) {
    return TextButton(child: Text("FrontWidget"), onPressed: this.func);
  }
}

class NomalWidget extends StatelessWidget {
  final Widget child;
  void Function() func;
  NomalWidget({@required this.child, @required this.func});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      TextButton(child: Text("NomalWidget"), onPressed: this.func),
      Container(padding: EdgeInsets.only(left: 20.0), child: child)
    ]));
  }
}

class ReverseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Text("ReverseWidget : ${Data.data3}"));
  }
}

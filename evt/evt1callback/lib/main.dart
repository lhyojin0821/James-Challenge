import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
  int secCount = 0;
  void firOnPressed() {
    setState(() {
      secCount++;
    });
  }

  int frontCount = 0;
  void backOnPressed() {
    setState(() {
      frontCount++;
    });
  }

  int reversCount = 0;
  void normalOnPressed() {
    setState(() {
      reversCount++;
    });
  }

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
                      onPressed: firOnPressed,
                    ),
                    SecWidget(
                      count: secCount,
                    )
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
                    BackWidget(
                        count: frontCount,
                        child: FrontWidget(
                          onPressed: backOnPressed,
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
                        onPressed: normalOnPressed,
                        child: ReverseWidget(
                          count: reversCount,
                        ))
                  ]))
            ]),
          ),
        ));
  }
}

class FirWidget extends StatelessWidget {
  VoidCallback onPressed;
  FirWidget({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text("FirWidget"),
      onPressed: onPressed,
    );
  }
}

class SecWidget extends StatelessWidget {
  int count;
  SecWidget({@required this.count});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Text("SecWidget : $count"));
  }
}

class BackWidget extends StatelessWidget {
  int count;
  final Widget child;
  BackWidget({@required this.child, @required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Text("BackWidget : $count")),
      Container(padding: EdgeInsets.only(left: 20.0), child: child)
    ]));
  }
}

class FrontWidget extends StatelessWidget {
  VoidCallback onPressed;
  FrontWidget({@required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return TextButton(child: Text("FrontWidget"), onPressed: onPressed);
  }
}

class NomalWidget extends StatelessWidget {
  VoidCallback onPressed;
  final Widget child;
  NomalWidget({@required this.child, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      TextButton(child: Text("NomalWidget"), onPressed: onPressed),
      Container(padding: EdgeInsets.only(left: 20.0), child: child)
    ]));
  }
}

class ReverseWidget extends StatelessWidget {
  int count;
  ReverseWidget({@required this.count});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Text("ReverseWidget : $count"));
  }
}

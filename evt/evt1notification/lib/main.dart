import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Data extends Notification {
  int data = 1;
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
  int data1 = 0;
  int data2 = 0;
  int data3 = 0;

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
                  child: NotificationListener(
                    onNotification: (Data d) {
                      setState(() {
                        this.data1 += d.data;
                      });
                      return true;
                    },
                    child: Column(children: [
                      Text("[같은 레벨], FirWidget 클릭 할 때, SecWidget 의 값을 변경하려면 ?"),
                      FirWidget(),
                      SecWidget(
                        data1: this.data1,
                      )
                    ]),
                  )),
              SizedBox(
                height: 50.0,
              ),
              Container(
                  padding: EdgeInsets.all(20.0),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  child: Column(children: [
                    Text("[하위 레벨] FontWidget 클릭 할 때, BackWidget 의 값을 변경하려면 ?"),
                    NotificationListener<Data>(
                      onNotification: (Data d) {
                        setState(() {
                          this.data2 += d.data;
                        });
                        return true;
                      },
                      child:
                          BackWidget(data2: this.data2, child: FrontWidget()),
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
                    Text(
                        "[상위 레벨], NomalWidget 클릭 할 때, ReverseWidget 의 값을 변경하려면 ?"),
                    NotificationListener(
                      onNotification: (Data d) {
                        setState(() {
                          this.data3 += d.data;
                        });
                        return true;
                      },
                      child: NomalWidget(
                          child: ReverseWidget(
                        data3: this.data3,
                      )),
                    )
                  ]))
            ]),
          ),
        ));
  }
}

class FirWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text("FirWidget"),
        onPressed: () {
          new Data().dispatch(context);
        });
  }
}

class SecWidget extends StatelessWidget {
  int data1;
  SecWidget({@required this.data1});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Text("SecWidget : ${this.data1}"));
  }
}

class BackWidget extends StatelessWidget {
  int data2;
  final Widget child;
  BackWidget({@required this.child, @required this.data2});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Text("BackWidget : ${this.data2}")),
      Container(padding: EdgeInsets.only(left: 20.0), child: child)
    ]));
  }
}

class FrontWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        child: Text("FrontWidget"),
        onPressed: () {
          new Data().dispatch(context);
        });
  }
}

class NomalWidget extends StatelessWidget {
  final Widget child;
  const NomalWidget({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
      TextButton(
          child: Text("NomalWidget"),
          onPressed: () {
            new Data().dispatch(context);
          }),
      Container(padding: EdgeInsets.only(left: 20.0), child: child)
    ]));
  }
}

class ReverseWidget extends StatelessWidget {
  int data3;
  ReverseWidget({@required this.data3});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Text("ReverseWidget : ${this.data3}"));
  }
}

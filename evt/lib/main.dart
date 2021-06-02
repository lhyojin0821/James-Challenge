import 'package:evt/evtProvider/evt1Provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Evt1Provider>(
        create: (BuildContext context) => Evt1Provider(),
        child: MaterialApp(home: PageWidget()));
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
    Evt1Provider provider1 = Provider.of<Evt1Provider>(context);
    return TextButton(
        child: Text("FirWidget"),
        onPressed: () {
          provider1.addI();
        });
  }
}

class SecWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Evt1Provider provider1 = Provider.of<Evt1Provider>(context);
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Text("SecWidget : ${provider1.i}"));
  }
}

class BackWidget extends StatelessWidget {
  final Widget child;
  const BackWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    Evt1Provider provider1 = Provider.of<Evt1Provider>(context);
    return Container(
        child: Column(children: [
      Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          child: Text("BackWidget : ${provider1.v}")),
      Container(padding: EdgeInsets.only(left: 20.0), child: child)
    ]));
  }
}

class FrontWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Evt1Provider provider1 = Provider.of<Evt1Provider>(context);
    return TextButton(
        child: Text("FrontWidget"),
        onPressed: () {
          provider1.addV();
        });
  }
}

class NomalWidget extends StatelessWidget {
  final Widget child;
  const NomalWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    Evt1Provider provider1 = Provider.of<Evt1Provider>(context);
    return Container(
        child: Column(children: [
      TextButton(
          child: Text("NomalWidget"),
          onPressed: () {
            provider1.addA();
          }),
      Container(padding: EdgeInsets.only(left: 20.0), child: child)
    ]));
  }
}

class ReverseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Evt1Provider provider1 = Provider.of<Evt1Provider>(context);
    return Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
        child: Text("ReverseWidget : ${provider1.a}"));
  }
}

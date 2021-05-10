import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widgets/navigatorPage.dart';

class ButtonWidget extends StatefulWidget {
  @override
  _ButtonWidgetState createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  final List<bool> isSelected = [false, false, true];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                ),
                child: Text('RaisedButton'),
                onPressed: () {
                  return;
                },
              ),
              BackButton(
                onPressed: () {
                  return;
                },
              ),
              CloseButton(
                onPressed: () {
                  return;
                },
              ),
              FloatingActionButton(
                  backgroundColor: Colors.red,
                  child: Icon(Icons.check),
                  onPressed: () {
                    return;
                  }),
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.blue,
                    backgroundColor: Colors.amber[100],
                  ),
                  child: Text('Outline Button'),
                  onPressed: () {
                    return;
                  }),
              RawMaterialButton(
                  fillColor: Colors.red[300],
                  child: Text('RawMaterialButton'),
                  onPressed: () {
                    return;
                  }),
              // ToggleButtons(
              //   children: [
              //     Icon(Icons.person),
              //     Icon(Icons.arrow_circle_up),
              //     Icon(Icons.phone),
              //   ],
              //   onPressed: (int index) {
              //     setState(() {
              //       for (int buttonIndex = 0;
              //           buttonIndex < isSelected.length;
              //           index++) {
              //         if (buttonIndex == index) {
              //           isSelected[buttonIndex] = true;
              //         } else {
              //           isSelected[buttonIndex] = false;
              //         }
              //       }
              //     });
              //   },
              //   isSelected: isSelected,
              // ),
              CupertinoButton(
                onPressed: () {},
                child: Text('Cupertino Button'),
              ),
              PopupMenuButton(
                child: Text('Pop'),
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(
                      child: Text('PopupMenuItem1'),
                      value: 'PopupMenuItem',
                    ),
                    PopupMenuItem(
                      child: Text('PopupMenuItem2'),
                      value: 'PopupMenuItem',
                    ),
                  ];
                },
              ),
              DropdownButton(
                onChanged: (int value) {
                  return;
                },
                hint: Text('DropdownButton'),
                items: [
                  DropdownMenuItem(
                    value: 1,
                    child: Text('1'),
                  ),
                  DropdownMenuItem(
                    value: 1,
                    child: Text('2'),
                  ),
                ],
              ),
              MaterialButton(
                  color: Colors.amber,
                  child: Text('MaterialButton'),
                  onPressed: () {
                    return;
                  }),
              InkWell(
                child: Text('InkWell'),
                onTap: () {
                  return;
                },
              ),
              GestureDetector(
                child: Text('GestureDetector'),
                onTap: () {
                  return;
                },
              ),
              TextButton(
                child: Text('TextButton, navigatorpop'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () {
                    return;
                  }),
              GestureDetector(
                child: Text('페이지이동'),
                onTap: () async {
                  String backValue = await Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return NavigatorPage(data: 'value');
                  }));
                  print(backValue);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

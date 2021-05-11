import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  String name;
  int value;

  PageTwo({@required this.name, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.value.toString()),
      ),
      body: ListView(
        children: [1, 2, 3, 4, 5].map<Widget>((_) {
          return this._listTile(
              leading: Icon(Icons.person),
              title: Text(
                'Title',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                'subTitle',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey,
                ),
              ),
              trailing: Icon(Icons.navigate_next),
              context: context,
              onTap: () {
                print(_);
              });
        }).toList(),
        // children: [1, 2, 3, 4]
        //     .map<Widget>((_) => ListTile(
        //           leading: Icon(Icons.person),
        //           title: Text('Title'),
        //           subtitle: Text('subTitle'),
        //           trailing: Icon(Icons.navigate_next),
        //           onTap: () {},
        //         ))
        //     .toList(),
      ),
    );
  }

  Widget _listTile({
    @required BuildContext context,
    @required Widget leading,
    @required Widget title,
    @required Widget subtitle,
    @required Widget trailing,
    @required void Function() onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: leading,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 48.0 - 20.0,
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [title, subtitle],
              ),
            ),
            Container(
              child: trailing,
            ),
          ],
        ),
      ),
    );
  }
}

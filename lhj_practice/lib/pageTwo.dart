import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  String name;
  int value;
  List datas;

  PageTwo({@required this.name, @required this.value, @required this.datas});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.value.toString()),
      ),
      body: ListView.builder(
        itemCount: this.datas.length,
        itemBuilder: (BuildContext context, int i) {
          return this._listTile(
              leading: Icon(Icons.person),
              title: Text(this.datas[i].toString()),
              subtitle: Text(''),
              trailing: Icon(Icons.navigate_next),
              onTap: () {},
              context: context);
        },
        // children: [1, 2, 3, 4].map((_) {
        //   return _listTile(
        //       context: context,
        //       leading: Icon(Icons.person),
        //       title: Text('Title'),
        //       subtitle: Text('subTitle'),
        //       trailing: Icon(Icons.navigate_next),
        //       onTap: () {
        //         print(_);
        //       });
        // }).toList(),
        // children: [1, 2, 3, 4].map((_) {
        //   return ListTile(
        //     leading: Icon(Icons.person),
        //     title: Text('Title'),
        //     subtitle: Text('subTitle'),
        //     trailing: Icon(Icons.navigate_next),
        //   );
        // }).toList(),
      ),
    );
  }

  Widget _listTile({
    @required Widget leading,
    @required Widget title,
    @required Widget subtitle,
    @required Widget trailing,
    @required void Function() onTap,
    @required BuildContext context,
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
              alignment: Alignment.centerLeft,
              width: MediaQuery.of(context).size.width - 48.0 - 20.0,
              padding: EdgeInsets.all(5.0),
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

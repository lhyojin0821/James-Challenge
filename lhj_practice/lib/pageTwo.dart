import 'package:flutter/material.dart';
import 'package:lhj_practice/models/detailModel.dart';

class PageTwo extends StatelessWidget {
  String name;
  // int value;
  List<DetailModel> datas;

  PageTwo({@required this.name, @required this.datas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text(this.value.toString()),
          ),
      body: ListView.builder(
        itemCount: this.datas.length,
        itemBuilder: (BuildContext context, int i) {
          return _listTile(
              leading: Icon(Icons.person),
              title: Text(
                this.datas[i].title,
                style: TextStyle(fontSize: 16.0),
              ),
              subtitle: Text(
                this.datas[i].name,
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
              ),
              trailing: Icon(Icons.navigate_next),
              onTap: () {},
              context: context);
        },
        // children: [1, 2, 3, 4].map<Widget>((_) {
        //   return _listTile(
        //       leading: Icon(Icons.person),
        //       title: Text('Title'),
        //       subtitle: Text('subTitle'),
        //       trailing: Icon(Icons.navigate_next),
        //       onTap: () {},
        //       context: context);
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
                padding: EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width - 48.0 - 20.0,
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
          )),
    );
  }
}

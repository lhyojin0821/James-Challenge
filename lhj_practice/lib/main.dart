import 'package:flutter/material.dart';
import 'package:lhj_practice/models/detailModel.dart';
import 'package:lhj_practice/models/mainModel.dart';
import 'package:lhj_practice/pageTwo.dart';
import 'package:lhj_practice/providerEx/test2Provider.dart';
import 'package:lhj_practice/providerEx/test4Provider.dart';
import 'package:lhj_practice/providerEx/testPage.dart';
import 'package:lhj_practice/providerEx/testProvider.dart';
import 'package:lhj_practice/vData.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainSys());
}

class MainSys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),

    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MainModel> transModel() {
    List<MainModel> result = vData.map<MainModel>((Map<String, dynamic> e) {
      return MainModel.fFrom2(ele: e);
    }).toList();
    return result;
  }

  List<MainModel> modelViewData;

  @override
  void initState() {
    this.modelViewData = this.transModel();
    if (!mounted) return;
    setState(() {});
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: this.modelViewData == null
          ? Center(
              child: Text('로딩중'),
            )
          : GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: this.modelViewData.length,
              itemBuilder: (BuildContext context, int i) {
                return _gridTile(
                    value: i,
                    context: context,
                    imgUrl: this.modelViewData[i].imgUrl,
                    name: this.modelViewData[i].name);
              },
              // children: _makeWidgets(),
            ),
    );
  }

  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1593642532744-d377ab507dc8?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '발라드'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1621447578058-6543ad48e6b2?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '댄스'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1621447578191-3869acfdfd6a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '힙합'
    },
  ];

  Widget _gridTile({
    @required String imgUrl,
    @required String name,
    @required BuildContext context,
    @required int value,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return PageTwo(
            datas: this.modelViewData[value].datas,
            name: name,
            // value: (() {
            //   int t = this
            //       .data
            //       .map<int>((Map<String, String> e) {
            //     if (e['name'] == name) {
            //       return this.data.indexOf(e);
            //     }
            //     return null;
            //   })
            //       .toList()
            //       .where((element) {
            //     if (element != null) {
            //       return true;
            //     }
            //     return false;
            //   })
            //       .toList()[0];
            //   return t;
            // })()
          );
        }));
      },
      child: Container(
        color: Colors.green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.only(right: 10.0),
              alignment: Alignment.centerRight,
              child: Icon(Icons.more_horiz),
            ),
            Container(
              width: 60.0,
              height: 60.0,
              decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(60.0),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(imgUrl))),
            ),
            Container(
              child: Text(name),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.person),
                  Icon(Icons.arrow_circle_up),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text('LOGO'),
      leading: Icon(Icons.menu),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lhj_practice/models/detailModel.dart';
import 'package:lhj_practice/models/mainModel.dart';
import 'package:lhj_practice/pageTwo.dart';
import 'package:lhj_practice/providerEx/test2Provider.dart';
import 'package:lhj_practice/providerEx/test4Provider.dart';
import 'package:lhj_practice/providerEx/testPage.dart';
import 'package:lhj_practice/providerEx/testProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MainSys());
}

class MainSys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TestProvider>(
            create: (BuildContext context) => TestProvider()),
        ChangeNotifierProvider<Test4Provider>(
            create: (BuildContext context) => Test4Provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: MainPage(),
        home: ChangeNotifierProvider<Test2Provider>(
            create: (BuildContext context) => Test2Provider(),
            child: TestPage()),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MainModel> transModel() {
    List<MainModel> result =
        this.vData.map<MainModel>((Map<String, dynamic> e) {
      // return MainModel(
      //   imgUrl: e['imgUrl'].toString(),
      //   name: e['name'].toString(),
      //   datas: List.from(e['datas']).map<DetailModel>((dynamic e) {
      //     return DetailModel(
      //         title: e['title'].toString(),
      //         name: e['name'].toString(),
      //         des: e['des'].toString(),
      //         img: e['img'].toString());
      //   }).toList(),
      // );
      // return MainModel.fForm1(ele: e);
      return MainModel.fFrom2(ele: e);
    }).toList();
    return result;
  }

  List<MainModel> modelViewData;
  @override
  void initState() {
    this.modelViewData = transModel();
    if (!mounted) return;
    setState(() {});
    super.initState();
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
            ),
    );
  }

  List<Map<String, dynamic>> vData = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1621135177072-57c9b6242e7a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'EDM',
      'datas': [
        {
          'title': '댄스노래1',
          'name': '댄스가수1',
          'des': '가사1',
          'img':
              'https://images.unsplash.com/photo-1621135177072-57c9b6242e7a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
        },
        {
          'title': '댄스노래2',
          'name': '댄스가수2',
          'des': '가사2',
          'img':
              'https://images.unsplash.com/photo-1621135177072-57c9b6242e7a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
        }
      ]
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1595909336425-5bf541155dec?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'POP',
      'datas': [
        {
          'title': '발라드노래1',
          'name': '발라드가수1',
          'des': '가사1',
          'img':
              'https://images.unsplash.com/photo-1595909336425-5bf541155dec?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
        },
        {
          'title': '발라드노래2',
          'name': '발라드가수2',
          'des': '가사2',
          'img':
              'https://images.unsplash.com/photo-1595909336425-5bf541155dec?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
        }
      ]
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1612899329140-7f16de31c54f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'K-POP',
      'datas': [
        {
          'title': '힙합노래1',
          'name': '힙합가수1',
          'des': '가사1',
          'img':
              'https://images.unsplash.com/photo-1612899329140-7f16de31c54f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
        },
        {
          'title': '힙합노래2',
          'name': '힙합가수2',
          'des': '가사2',
          'img':
              'https://images.unsplash.com/photo-1612899329140-7f16de31c54f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
        }
      ]
    },
  ];

  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1621135177072-57c9b6242e7a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw5fHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'EDM'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1595909336425-5bf541155dec?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'POP'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1612899329140-7f16de31c54f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': 'K-POP'
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
            // datas: this.vData[value]['datas'],
            name: name,
            // value: (() {
            //   int t = this
            //       .data
            //       .map<int>((Map<String, String> e) {
            //         if (e['name'] == name) {
            //           return this.data.indexOf(e);
            //         }
            //         return null;
            //       })
            //       .toList()
            //       .where((element) {
            //         if (element != null) {
            //           return true;
            //         }
            //         return false;
            //       })
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
              child: Text(
                name,
                style: TextStyle(fontSize: 16.0),
              ),
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
      actions: [IconButton(icon: Icon(Icons.settings), onPressed: () {})],
    );
  }
}

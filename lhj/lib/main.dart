import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lhj/models/detailModel.dart';
import 'package:lhj/models/mainConnectModel.dart';
import 'package:lhj/models/mainModel.dart';
import 'package:lhj/pageTwo.dart';
import 'package:lhj/poviderex/test2Provider.dart';
import 'package:lhj/poviderex/test4Provider.dart';
import 'package:lhj/poviderex/testPage.dart';
import 'package:lhj/poviderex/testProvider.dart';
import 'package:lhj/provides/mainProvider.dart';
import 'package:lhj/repo/connect.dart';
import 'package:provider/provider.dart';
// http class 로 묶여있지 않아서 as http 사용
import 'package:http/http.dart' as http;

void main() {
  runApp(new MainSys()); //플러터 실행하는 함수
}

// 상태 변수 : 변하는 값 -> 기준 점
// Widget : stl || stf
// Provider : 상태 관리 패키지 - 로직
// --> GetX, MobX ...
// --> context 에 의존해서 상태관리

// -System 단위 1개만
class MainSys extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TestProvider>(
            create: (BuildContext context) => new TestProvider()),
        ChangeNotifierProvider<Test4Provider>(
            create: (BuildContext context) => new Test4Provider()),
      ],
      child: new MaterialApp(
        // home: new MainPage(),
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<Test2Provider>(
              create: (BuildContext context) => new Test2Provider(),
              // child: new TestPage()
            ),
            ChangeNotifierProvider<MainProvider>(create: (_) => MainProvider())
          ],
          child: MainPage2(),
        ),
      ),
    );
  }
}

// - page 단위 Scaffold 필요한만큼
class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<MainModel> transModel() {
    List<MainModel> result = this.vData.map<MainModel>(
        //   (Map<String, dynamic> ele) => new MainModel(
        //     imgUrl: ele['imgUrl'].toString(),
        //     name: ele['name'].toString(),
        //     //List<DetailModel>[new DetailModel(..),...
        //     //[{}] -> [new detailModel()]
        //     datas: List.from(ele['datas']).map((dynamic e) {
        //       return new DetailModel.init(e: e);
        //     }).toList(),
        //   ),
        // )
        // .toList();
        //     (Map<String, dynamic> ele) => new MainModel.ffrom(ele: ele)).toList();
        // return result;
        (Map<String, dynamic> ele) => new MainModel.fFrom1(ele: ele)).toList();
    // (Map<String, dynamic> element) => new MainModel.fFrom2(ele: element)).toList();
    return result;
  }

  List<MainModel> modelViewData;

  @override
  void initState() {
    // this.modelViewData = this.transModel();
    // if (!mounted) return;
    // setState(() {});
    // Future(this.connect)
    // .then((_){
    //   if (!mounted) return;
    //   setState(() {});
    //   return;
    // });
    //

    // MVC/P(모델,뷰,컨트롤러) 개발, 패턴 -> 개발을 패턴화
    // - 장점) 개발이 빠르다 / 개발 집중도가 올라가기 때문
    // - 단점) 느리다(객체지향의 문제)
    Future(() async {
      // this.modelViewData = await new Connect().connect();
      if (!mounted) return;
      setState(() {});
      return;
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // (* 1)
    // List<MainModel> result = this
    //     .vData
    //     .map<MainModel>(
    //       (Map<String, dynamic> ele) => new MainModel(
    //     imgUrl: ele['imgUrl'].toString(),
    //     name: ele['name'].toString(),
    //     datas: List.from(ele['datas']),
    //   ),
    // )
    //     .toList();
    //
    // print('1 : $result');
    print('2: $modelViewData');

    return new Scaffold(
      // (*3) extends || mixIn
      appBar: this._appBar(),
      body: this.modelViewData == null
          ? Center(
              child: Text('로딩중...'),
            )
          : this.modelViewData.isEmpty
              ? Center(
                  child: Text('오류가 발생 했습니다, 고객센터로 연락주세요'),
                )
              : new GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                  ),
                  // children: [
                  //   this._gridTile(
                  //     imgUrl:
                  //         'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
                  //     name: '홍길동',
                  //   ),
                  //   this._gridTile(
                  //     imgUrl:
                  //         'https://images.unsplash.com/photo-1620238669212-cb4942397110?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
                  //     name: '백두산',
                  //   ),
                  //   this._gridTile(
                  //     imgUrl:
                  //         'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
                  //     name: '한라산',
                  //   ),
                  // ],
                  // children: this._makeWidgets(this.data),
                  itemCount: this.modelViewData.length,
                  itemBuilder: (BuildContext context, int i) => this._gridTile(
                    imgUrl: this.modelViewData[i].imgUrl,
                    name: this.modelViewData[i].name,
                    context: context,
                    value: i,
                  ),
                ),
    );
  }

  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
      'name': '홍길동',
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620238669212-cb4942397110?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '백두산'
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
      'name': '한라산'
    }
  ];

  List<Map<String, dynamic>> vData = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
      'name': '댄스',
      'datas': [
        {
          'title': '댄스노래1',
          'name': '댄스가수1',
          'des': '가사1',
          'img':
              'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80'
        },
        {'title': '댄스노래2', 'name': '댄스가수2', 'des': '가사2', 'img': ''},
      ],
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1620238669212-cb4942397110?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '발라드',
      'datas': [
        {
          'title': '발라드노래1',
          'name': '발라드가수1',
          'des': '가사1',
          'img':
              'https://images.unsplash.com/photo-1620238669212-cb4942397110?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
        },
        {'title': '발라드노래2', 'name': '발라드가수2', 'des': '가사2', 'img': ''},
      ],
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1593642532454-e138e28a63f4?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80',
      'name': '힙합',
      'datas': [
        {'title': '힙합노래1', 'name': '힙합가수1', 'des': '가사1', 'img': ''},
        {'title': '힙합노래2', 'name': '힙합노래2', 'des': '가사2', 'img': ''},
      ],
    }
  ];

  PreferredSizeWidget _appBar() => AppBar(
        backgroundColor: Colors.green,
        title: Text('LOGO'),
        // 안드로이드 가운데 정렬
        // centerTitle: true,// Color
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
            icon: new Icon(Icons.settings),
            onPressed: () {
              // ....
              return;
            },
          ),
        ],
      );

  Widget _gridTile(
          {@required BuildContext context,
          @required String imgUrl,
          @required String name,
          @required int value}) =>
      GestureDetector(
        // -> 클릭이나 드래그... -> 애니메이션 효과가 없음
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) => new PageTwo(
              // datas: List.from(this.vData[value]['datas']),
              datas: this.modelViewData[value].datas,
              name: name,

              // value: (() {
              //   // 순번을 찾는 행
              //   // List<int> l = this.data.map<int>((Map<String, String> e) {
              //   //   if (e['name'] == name) {
              //   //     return this.data.indexOf(e);
              //   //   }
              //   //   return null;
              //   // }).toList();
              //   // print(l);
              //   // List<int> r = l.where((int element) {
              //   //   if (element != null) return true;
              //   //   return false;
              //   // }).toList();
              //   // print(r);
              //   // 줄여서 쓰는 법
              //   int t = ((this.data.map<int>((Map<String, String> e) {
              //     if (e['name'] == name) {
              //       return this.data.indexOf(e);
              //     }
              //     return null;
              //   }).toList())
              //       .where((int element) {
              //     if (element != null) return true;
              //     return false;
              //   }).toList())[0];
              //
              //   // 줄여서 쓰는 법2 --> where 이 r2를 수정하지 못함
              //   // List<int> r2 = this.data.map<int>((Map<String, String> e) {
              //   //   if (e['name'] == name) {
              //   //     return this.data.indexOf(e);
              //   //   }
              //   //   return null;
              //   // }).toList()
              //   //   ..where((int element) {
              //   //     if (element != null) return true;
              //   //     return false;
              //   //   }).toList();
              //
              //   // return r[0];
              //   return t;
              //   // return r2[0];
              // })(),
            ),
          ),
        ),

        // InKWell -> 단순클릭, 길게 눌렀을 / 애니메이션 효과가 있음
        child: Container(
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                // width: (MediaQuery.of(context).size.width / 2) - 5.0,
                // height: 20.0,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 10.0),
                color: Colors.pink,
                child: Icon(Icons.more_horiz),
              ),
              Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(60.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imgUrl),
                  ),
                ),
              ),
              Container(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                color: Colors.purple,
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

class MainPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // provider
    MainConnectModel data = Provider.of<MainProvider>(context).model;

    return Scaffold(
      appBar: AppBar(),
      body: _netCheck(data),
    );
  }
}

// @@ TODO : 8일 Widget Class 로 분리
Widget _netCheck(MainConnectModel data) {
  if (data == null)
    return Center(
      child: Text('로딩중..'),
    );
  if (data.netCheck == NetCheck.Error)
    return Center(
      child: Text('고객센터로..'),
    );
  if (data.netCheck == NetCheck.TimeOut)
    return Center(
      child: Text('새로고침..'),
    );
  if (data.netCheck == NetCheck.ServerError)
    return Center(
      child: Text('서버문제 고객센터로..'),
    );
  return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemCount: data.mainModels.length,
      itemBuilder: (BuildContext context, int i) => Container(
            child: Text(data.mainModels[i].name),
          ));
}

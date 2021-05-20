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
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider<TestProvider>(
    //         create: (BuildContext context) => TestProvider()),
    //     ChangeNotifierProvider<Test4Provider>(
    //         create: (BuildContext context) => Test4Provider())
    //   ],
    child:
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
      // home: ChangeNotifierProvider<Test2Provider>(
      //     create: (BuildContext context) => Test2Provider(),
      //     child: TestPage()),
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

  List<Map<String, dynamic>> vData = [
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1593642532744-d377ab507dc8?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '발라드',
      'datas': [
        {
          'title': '너를 만나',
          'name': '폴킴',
          'des': '''     
          너를 만난 그 이후로 사소한 변화들에 
          행복해져 눈이 부시게 빛 나는 아침
          너를 떠올리며 눈 뜨는 하루 식탁 위에 마주 앉아
          너의 하루는 어땠는지 묻거나
          나의 하루도 썩 괜찮았어
          웃으며 대답해 주고 싶어
          별것 아닌 일에 맘이 통할 때면
          익숙해진 서로가 놀라웠어
          널 사랑해
          평온한 지금처럼만
          영원하고 싶다고
          너를 바라보다 생각했어
          너를 만나 참 행복했어
          나 이토록 사랑할 수 있었던 건
          아직 어리고 모자란 내 맘
          따뜻한 이해로 다 안아줘서
          무심한 말투에 서로 아플 때면
          차가워진 사이가
          견딜 수 없어 미안해
          불안한 지금이라도
          영원하고 싶다고
          너를 바라보다 생각했어
          너를 만나 참 행복했어
          나 이토록 사랑할 수 있었던 건
          아직 어리고 모자란 내 맘
          따뜻한 이해로 다 안아줘서
          뜨거웠던 여름 지나
          그리워질 빗소리에
          하나 둘 수줍어 또 얼굴 붉히면
          생각이 많아진 너의 눈에 입 맞출 테니
          우리 함께 걸어가기로 해
          나를 만나 너도 행복하니
          못 해준 게 더 많아서 미안해
          이기적이고 불안한 내가
          너에게만은 잘하고 싶었어
          오랫동안 나 기다려온
          완벽한 사랑을 찾은 것 같아
          날 잡아줘서 힘이 돼줘서
          소중한 배려로 날 안아줘서
          너를 만나''',
          'img':
              'https://image.bugsm.co.kr/album/images/500/202037/20203701.jpg'
        },
        {'title': '발라드노래2', 'name': '발라드가수2', 'des': '가사2', 'img': ''},
      ],
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1621447578058-6543ad48e6b2?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '댄스',
      'datas': [
        {
          'title': '댄스노래1',
          'name': '댄스가수1',
          'des': '가사1',
          'img':
              'https://images.unsplash.com/photo-1621447578058-6543ad48e6b2?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'
        },
        {'title': '댄스노래2', 'name': '댄스가수2', 'des': '가사2', 'img': ''},
      ],
    },
    {
      'imgUrl':
          'https://images.unsplash.com/photo-1621447578191-3869acfdfd6a?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxM3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
      'name': '힙합',
      'datas': [
        {'title': '힙합노래1', 'name': '힙합가수1', 'des': '가사1', 'img': ''},
        {'title': '힙합노래2', 'name': '힙합가수2', 'des': '가사2', 'img': ''},
      ],
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

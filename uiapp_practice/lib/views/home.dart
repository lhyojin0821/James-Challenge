import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Map<String, String>> data = [
    {
      'imgUrl':
          'https://cdn.pixabay.com/photo/2021/07/01/21/20/girl-6380331__480.jpg',
      'name': '임효진'
    },
    {
      'imgUrl':
          'https://cdn.pixabay.com/photo/2021/05/25/12/59/mountain-6282389__480.jpg',
      'name': '플러터'
    },
    {
      'imgUrl':
          'https://cdn.pixabay.com/photo/2021/05/14/10/00/flowers-6253005__480.jpg',
      'name': '다트'
    },
  ];

  int index = 0;
  PageController? _pageController;
  @override
  void initState() {
    this._pageController = new PageController();
    super.initState();
  }

  @override
  void dispose() {
    this._pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.yellow,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            this._title(title: 'Title', fontSize: 16.0),
            this._topBanner(data: this.data, context: context),
            Container(),
            Container(),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }

  Widget _title({required String title, required double fontSize}) => Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(20.0),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
        ),
      );

  Widget _topBanner(
          {required List<Map<String, String>> data,
          required BuildContext context}) =>
      Container(
        child: Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: data
                      .map<Widget>(
                        (Map<String, String> e) => GestureDetector(
                          child: GestureDetector(
                            child: Text(
                              'Select ${data.indexOf(e)}',
                              style: TextStyle(
                                  color: data.indexOf(e) == this.index
                                      ? Colors.orange
                                      : Colors.grey),
                            ),
                            onTap: () {
                              setState(() {
                                this.index = data.indexOf(e);
                              });
                              this
                                  ._pageController
                                  ?.animateToPage(data.indexOf(e),
                                      duration: Duration(
                                        microseconds: 400,
                                      ),
                                      curve: Curves.easeIn);
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                height: 300.0,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                  controller: this._pageController,
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int i) {
                    return Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      data[i]['imgUrl'].toString()),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(top: 10.0, left: 10.0),
                            child: Text(data[i]['name'].toString()),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
}

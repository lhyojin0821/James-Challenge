import 'package:flutter/material.dart';
import 'package:kopo/kopo.dart';
import 'package:widgets/orientationpage.dart';

class KaKaoMapPage extends StatefulWidget {
  @override
  _KaKaoMapPageState createState() => _KaKaoMapPageState();
}

class _KaKaoMapPageState extends State<KaKaoMapPage> {
  String adressValue = '주소를 검색해주세요';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kopo Page'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(this.adressValue),
            TextButton(
              child: Text('주소 검색'),
              onPressed: () async {
                var result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Kopo();
                    },
                  ),
                );
                if (result != null) {
                  setState(() {
                    this.adressValue = result;
                  });
                }
              },
            ),
            GestureDetector(
                child: Text('다음페이지'),
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return OrientationPage();
                  }));
                })
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lhj/provides/loginCheckProvider.dart';
import 'package:lhj/repo/connect.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class KakaoLogin extends StatefulWidget {
  @override
  _KakaoLoginState createState() => _KakaoLoginState();
}

class _KakaoLoginState extends State<KakaoLogin> {
  Connect connect = new Connect();
  String kakaoUrl;

  @override
  void initState() {
    Future.microtask(() async {
      this.kakaoUrl = await this.connect.kakaoLoginKey();
      if (!mounted) return;
      setState(() {});
      return;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 1. 빌드 메서드
    // String key = '06e2d5f00c1fc8a1097eb77c1487ec3b';
    // String rUrl = 'http://192.168.0.15:3000/oauth';
    // String url =
    // 'https://kauth.kakao.com/oauth/authorize?client_id=$key&redirect_uri=$rUrl&response_type=code';

    LoginCheckProvider loginCheckProvider =
        Provider.of<LoginCheckProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('카카오 로그인 중'),
      ),
      body: SafeArea(
        child: this.kakaoUrl == null
            ? Center(
                child: Text('진행중....'),
              )
            : WebView(
                initialUrl: this.kakaoUrl, // 2. 문자열 그대로 넣거나 / 3. 함수로 사용하거나
                javascriptMode: JavascriptMode.unrestricted,
                javascriptChannels: {
                  JavascriptChannel(
                      name: 'hyojin',
                      onMessageReceived: (JavascriptMessage msg) {
                        print(msg.message);
                        if (msg.message == '1') {
                          Future.microtask(() async =>
                                  await loginCheckProvider.setCheck(true))
                              .then((_) => Navigator.of(context).pop());
                        }
                      }),
                },
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lhj_practice/providers/loginCheckProvider.dart';
import 'package:lhj_practice/repo/connect.dart';
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
      this.kakaoUrl = await connect.kakaoLoginKey();
      if (!mounted) return;
      setState(() {});
      return;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginCheckProvider loginCheckProvider =
        Provider.of<LoginCheckProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('카카오 로그인'),
      ),
      body: SafeArea(
        child: this.kakaoUrl == null
            ? Center(
                child: Text('진행중....'),
              )
            : WebView(
                initialUrl: this.kakaoUrl,
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

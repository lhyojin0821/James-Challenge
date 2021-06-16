import 'package:flutter/material.dart';
import 'package:lhj_practice/main.dart';
import 'package:lhj_practice/providers/loginCheckProvider.dart';
import 'package:lhj_practice/repo/connect.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode idNode = new FocusNode();
  FocusNode pwNode = new FocusNode();

  TextEditingController idCt = new TextEditingController();
  TextEditingController pwCt = new TextEditingController();

  Connect connect = new Connect();

  @override
  void dispose() {
    idCt?.dispose();
    pwCt?.dispose();
    super.dispose();
  }

  LoginCheckProvider loginCheckProvider;
  @override
  Widget build(BuildContext context) {
    if (this.loginCheckProvider == null) {
      this.loginCheckProvider = Provider.of<LoginCheckProvider>(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              kToolbarHeight -
              MediaQuery.of(context).padding.top,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 400.0,
                height: 400.0,
                color: Colors.red,
              ),
              Container(
                width: 300.0,
                child: TextField(
                  focusNode: this.idNode,
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    prefixIcon: Icon(Icons.email),
                  ),
                  controller: this.idCt,
                  textInputAction: TextInputAction.next,
                  onSubmitted: (String s) {},
                ),
              ),
              Container(
                width: 300.0,
                child: TextField(
                  focusNode: this.pwNode,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'password',
                    suffixIcon: Icon(Icons.password),
                  ),
                  controller: this.pwCt,
                  onSubmitted: (String s) async {
                    print('id: ${this.idCt.text}');
                    print('id: ${this.pwCt.text}');
                    await connect.loginConnect(
                        id: this.idCt.text, pw: this.pwCt.text);
                  },
                ),
              ),
              TextButton(
                onPressed: () async {
                  print('id: ${this.idCt.text}');
                  print('id: ${this.pwCt.text}');
                  bool loginCheck = await connect.loginConnect(
                      id: this.idCt.text, pw: this.pwCt.text);
                  if (!loginCheck) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('ID 와 password 를 확인 해주세요.'),
                        );
                      },
                    );
                    return;
                  }
                  await this.loginCheckProvider.setCheck(loginCheck);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (BuildContext context) {
                    return MainPage2();
                  }));
                },
                child: Text('Login'),
              ),
              TextButton(
                child: Text('KakaoLogin'),
                onPressed: () async {
                  String key = '2494f3a15ff25809d37ac8ebb915cea6';
                  String rUrl = 'http://172.30.1.9:3000/oauth';
                  String url =
                      'https://kauth.kakao.com/oauth/authorize?client_id=$key&redirect_uri=$rUrl&response_type=code';
                  //'https://kauth.kakao.com/oauth/authorize?client_id=2494f3a15ff25809d37ac8ebb915cea6&redirect_uri=http://172.30.1.9:3000/oauth&response_type=code';
                  // http.Response res = await http.get(url);
                  // print(res.body);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return Scaffold(
                        appBar: AppBar(
                          title: Text('카카오 로그인'),
                        ),
                        body: SafeArea(
                          child: WebView(
                            initialUrl: url,
                            javascriptMode: JavascriptMode.unrestricted,
                            javascriptChannels: {
                              JavascriptChannel(
                                  name: 'hyojin',
                                  onMessageReceived: (JavascriptMessage msg) {
                                    print(msg.message);
                                    if (msg.message == '1') {
                                      Future.microtask(() async =>
                                          await loginCheckProvider
                                              .setCheck(true)).then(
                                          (_) => Navigator.of(context).pop());
                                    }
                                  }),
                            },
                          ),
                        ));
                  }));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

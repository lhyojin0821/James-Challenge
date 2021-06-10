import 'package:flutter/material.dart';
import 'package:lhj/main.dart';
import 'package:lhj/provides/loginCheckProvider.dart';
import 'package:lhj/provides/loginCheckProvider.dart';
import 'package:lhj/provides/loginCheckProvider.dart';
import 'package:lhj/repo/connect.dart';
import 'package:provider/provider.dart';

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
                  controller: this.idCt,
                  decoration: InputDecoration(
                      hintText: "E-mail", prefixIcon: Icon(Icons.email)),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onSubmitted: (String s) {
                    // print(s);
                  },
                ),
              ),
              Container(
                width: 300.0,
                child: TextField(
                  focusNode: this.pwNode,
                  controller: this.pwCt,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "password",
                    suffixIcon: Icon(Icons.person),
                  ),
                  onSubmitted: (String s) async {
                    print("id: ${this.idCt.text}");
                    print("pw: ${this.pwCt.text}");
                    await this
                        .connect
                        .loginConnect(id: this.idCt.text, pw: this.pwCt.text);
                  },
                ),
              ),
              TextButton(
                  onPressed: () async {
                    print("id: ${this.idCt.text}");
                    print("pw: ${this.pwCt.text}");
                    bool loginCheck = await this
                        .connect
                        .loginConnect(id: this.idCt.text, pw: this.pwCt.text);
                    if (!loginCheck) {
                      await showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text('ID 와 password 를 확인 해주세요'),
                        ),
                      );
                      return;
                    }
                    await this.loginCheckProvider.setCheck(loginCheck);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return MainPage2();
                    }));
                  },
                  child: Text('login'))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:lhj/repo/pref.dart';

class LoginCheckProvider with ChangeNotifier {
  bool check;
  final String _PREF_KEY = 'checkKey';

  LoginCheckProvider() {
    Future(_init);
  }

  Future<void> _init() async {
    //'{ key : value }'

    // SharedPreferences pref = await SharedPreferences.getInstance();
    // this.check = pref.getBool(_PREF_KEY) ?? false;
    this.check = await Pref.getBool(_PREF_KEY);
    notifyListeners();
    return;
  }

  Future<void> setCheck(bool check) async {
    // SharedPreferences pref = await SharedPreferences.getInstance();
    // await pref.setBool(_PREF_KEY, check);
    await Pref.setBool(_PREF_KEY, check);
    this.check = check;
    notifyListeners();
    return;
  }
}

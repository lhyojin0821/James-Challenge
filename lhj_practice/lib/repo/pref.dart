import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static SharedPreferences _preferences;

  static Future<SharedPreferences> init() async {
    if (Pref._preferences == null) {
      Pref._preferences = await SharedPreferences.getInstance();
    }
    return _preferences;
  }

  static Future<bool> getBool(String key) async {
    SharedPreferences pref = await Pref.init();
    return pref.getBool(key) ?? false;
  }

  static Future<void> setBool(String key, bool value) async {
    SharedPreferences pref = await Pref.init();
    await pref.setBool(key, value);
    return;
  }
}

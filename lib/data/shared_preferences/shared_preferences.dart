import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharePreferenceHelper {
  SharePreferenceHelper._();
  static final SharePreferenceHelper _sharePreferences = SharePreferenceHelper._internal();

  factory SharePreferenceHelper() {
    return _sharePreferences;
  }

  SharePreferenceHelper._internal();

  saveObject(String key, dynamic obj) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(obj);
    _prefs.setString(key.toString(), data);
    print('saveObject: $key-$data');
  }

  saveBool(String key, bool value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setBool(key.toString(), value);
    print('saveBool: $key-$value');
  }

  saveString(String key, String value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setString(key.toString(), value);
    print('saveString: $key-$value');
  }

  saveInt(String key, int value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setInt(key.toString(), value);
    print('saveInt: $key-$value');
  }

  saveDouble(String key, double value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.setDouble(key.toString(), value);
    print('saveInt: $key-$value');
  }

  Future<dynamic> getObject(String key) async {
    try{
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      final str = _prefs.getString(key.toString());
      print('getObject:  $key-$str');
      if (str != null) {
        return jsonDecode(str);
      } else {
        return null;
      }
    }catch(error) {
      print('getObject:  $key');
      return null;
    }
  }

  Future<bool> getBool(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final boolValue = _prefs.getBool(key.toString()) ?? false;
    print('getBool: $key-$boolValue');
    return boolValue;
  }

  Future<String> getString(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final value = _prefs.getString(key.toString()) ?? "";
    print('getString: $key-$value');
    return value;
  }

  Future<int> getInt(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final value = _prefs.getInt(key.toString()) ?? -1;
    print('getInt: $key-$value');
    return value;
  }

  Future<double> getDouble(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final value = _prefs.getDouble(key.toString()) ?? 0.0;
    print('getString: $key-$value');
    return value;
  }

  clearObject(String key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    final data = jsonEncode(null);
    _prefs.setString(key.toString(), data);
    print('clearObject: $key-$data');
  }

  clearAllData() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.clear();
  }
}
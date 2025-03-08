import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? _sharedPrefs;

  init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  String getData(String key) {
    return _sharedPrefs?.getString(key) ?? "";
  }

  void removeData(String key) {
    _sharedPrefs?.remove(key);
  }

  void setData(String key, String value) {
    _sharedPrefs?.setString(key, value);
  }

  void saveJsonData(String key, List<dynamic> jsonData) {
    String jsonString = jsonEncode(jsonData);
    _sharedPrefs?.setString(key, jsonString);
  }

  List<dynamic> getJsonData(String key) {
    String jsonString = _sharedPrefs?.getString(key) ?? '[]';
    return jsonDecode(jsonString);
  }
}

final sharedPrefs = SharedPrefs();

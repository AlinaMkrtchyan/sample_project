import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPreferences? _sharedPrefs;

  Future<void> init() async {
    _sharedPrefs ??= await SharedPreferences.getInstance();
  }

  Future<void> setString(String key, String value) async {
    await _sharedPrefs?.setString(key, value);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

void clearSharedPrefs() async {
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  _sharedPreferences.clear();
}

void addStringValueToSharedPrefs(String key, String value) async {
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  _sharedPreferences.setString(key, value);
}

void addIntValueToSharedPrefs(String key, int value) async {
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  _sharedPreferences.setInt(key, value);
}

getIntValueFromSharedPrefs(String key) async {
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  int value = _sharedPreferences.getInt(key);
  return value;
}

getStringFromSharedPrefs(String key) async {
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  String value = _sharedPreferences.getString(key);
  return value;
}

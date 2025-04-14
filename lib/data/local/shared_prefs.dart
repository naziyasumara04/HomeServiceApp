import 'package:shared_preferences/shared_preferences.dart';



setKeyFromPrefs(String key, String value) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.setString(key, value);
}

getKeyFromPrefs(String key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

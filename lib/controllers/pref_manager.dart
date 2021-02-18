import 'package:shared_preferences/shared_preferences.dart';

class PrefManager {
  static SharedPreferences _prefs;

  static const String TOKEN = 'token';

  static Future<Null> _initialize() async{
    if(_prefs == null)
      _prefs = await SharedPreferences.getInstance();
  }

  static void storeToken(String token) async{
    await _initialize();
    _prefs.setString(TOKEN, token);
  }

  static Future<String> getToken() async {
    await _initialize();
    return _prefs.get(TOKEN);
  }

  static void removeToken() async {
    await _initialize();
    _prefs.remove(TOKEN);
  }
}
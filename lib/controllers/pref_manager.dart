import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/MealPlan.dart';

class PrefManager {
  static SharedPreferences _prefs;

  static const String TOKEN = 'token';
  static const String ACTIVE_MEALPLAN = 'mealplan';

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

  static void storeActiveMealPlan(MealPlan mealPlan) async {
    await _initialize();
    _prefs.setString(ACTIVE_MEALPLAN, jsonEncode(mealPlan));
  }

  static Future<MealPlan> getActiveMealPlan() async {
    await _initialize();
    String json = _prefs.get(ACTIVE_MEALPLAN);

    if(json == null)
      return null;

    print("Received MealPlan: \n$json");

    return MealPlan.fromJson(jsonDecode(json));
  }

  static void removeActiveMealPlan() async {
    await _initialize();
    _prefs.remove(ACTIVE_MEALPLAN);
  }
}
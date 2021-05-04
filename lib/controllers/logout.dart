// not sure where to put this function
import 'package:flutter/cupertino.dart';
import 'package:foodster/controllers/pref_manager.dart';

void logout(BuildContext context) {
  PrefManager.removeToken();
  PrefManager.removeActiveMealPlan();
  Navigator.of(context).popUntil((route) => route.isFirst);
  Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
}
// not sure where to put this function
import 'package:flutter/cupertino.dart';
import 'package:foodster/pref_manager.dart';

void logout(BuildContext context) {
  PrefManager.removeToken();
  Navigator.of(context).popUntil((route) => route.isFirst);
  Navigator.of(context).popAndPushNamed('/login');
}
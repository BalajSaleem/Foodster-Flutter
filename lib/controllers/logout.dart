// not sure where to put this function
import 'package:flutter/cupertino.dart';
import 'package:foodster/controllers/pref_manager.dart';

import 'http_caller.dart';
import 'ui_utils.dart';

Function tokenExpired(BuildContext context){

    bool atLoginPage = false;

    Navigator.popUntil(context, (route) {
      if(route.settings.name == '/login'){
        atLoginPage = true;
      }
      return true;
    });

    if(!atLoginPage) {
      UiUtils.showToast("Your session expired. Please login again");
      logout(context);
    }
}

void logout(BuildContext context) {
  PrefManager.removeToken();
  PrefManager.removeActiveMealPlan();
  Navigator.of(context).popUntil((route) => route.isFirst);
  Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
}
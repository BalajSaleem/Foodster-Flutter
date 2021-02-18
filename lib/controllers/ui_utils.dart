import 'package:fluttertoast/fluttertoast.dart';

class  UiUtils {
  static void showToast(String msg){
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
  }

  static String firstLetterUppercase(String s){
    if(s == null || s == '')
      return s;
    return '${s[0].toUpperCase()}${s.substring(1).toLowerCase()}';
  }
}
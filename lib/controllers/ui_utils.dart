import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodster/Model/Recipe.dart';
import 'package:foodster/Model/Serving.dart';

class  UiUtils {
  static void showToast(String msg){
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
  }

  static String firstLetterUppercase(String s){
    if(s == null || s == '')
      return s;
    return '${s[0].toUpperCase()}${s.substring(1).toLowerCase()}';
  }

  static String dateToString(DateTime today){
    String dateSlug ="${today.year.toString()}-${today.month.toString().padLeft(2,'0')}-${today.day.toString().padLeft(2,'0')}";
    return dateSlug;
  }
  
  static String replaceSpaces(String str){
    return str.replaceAll(" ", "%20");
  }

}
import 'package:fluttertoast/fluttertoast.dart';


class  UiUtils {
  static void showToast(String msg){
    Fluttertoast.showToast(msg: msg, toastLength: Toast.LENGTH_LONG);
  }
}
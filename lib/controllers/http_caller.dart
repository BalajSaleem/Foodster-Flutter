import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpCaller {
  static const String _baseUrl = "https://foodster-cs491.herokuapp.com";

  // handled through callback
  static void signup(String email, String password, Function callback){
    print("email: ${email}, password: ${password}");

    http.post(
      _baseUrl + '/users/signup',
        body: {
         'email': email,
         'password': password
       }
    ).then((http.Response response) {
      print(response.statusCode);
      print(response.body);
      if(response.statusCode == 201)
        callback(true, response.statusCode , json.decode(response.body)['token']);
      else
        callback(false, response.statusCode);
    },
      onError: (e){
        print(e);
        callback(false, -1);
      }
    );
  }

  // handled through callback
  static void login(String email, String password, Function callback){
    http.post(
      _baseUrl + '/users/login',
      body: {
        'email': email,
        'password': password
      }
    ).then((http.Response response){
      print(response.statusCode);
      print(response.body);

      if(response.statusCode == 200){
        callback(true, response.statusCode, json.decode(response.body)['token']);
      }
      else{
        callback(false, response.statusCode);
      }
    },
    onError: (e){
      print(e);
      callback(false, -1);
    });
  }

  // handled syncronously
  // return a list of json objects for meals
  // return null on failure
  static Future<List<Map<String, dynamic>>> generateMeals (String token, dynamic statusCodeWrapper) async {
    http.Response response = await http.post(
     _baseUrl + '/meals/generate',
      headers: {
        'Authorization' : 'Bearer $token',
        'content-type' : 'application/json'
      },
      body: json.encode({
        "breakfast_number": 1,
        "lunch_number": 1,
        "dinner_number": 1,
        "snack_number": 0,
        "calories": 243,
        "protein": 5.8,
        "carbs": 37.4,
        "fat": 9.8
      })).catchError((error) {
        print(error);
        return null;
    });

    List<Map<String, dynamic>> list;
    if(response != null && response.statusCode == 200){

      print(response.body);
      list = [];

      for( Map<String, dynamic> jsonObject in json.decode(response.body)){
        list.add(jsonObject);
      }
    }
    else{
      list = null;
    }

    statusCodeWrapper['statusCode'] = response.statusCode;
    return list;
  }
}


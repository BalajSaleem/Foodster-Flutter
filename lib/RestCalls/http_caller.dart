import 'package:foodster/Model/MealPlan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpCaller {
  static const String _baseUrl = "https://foodster-cs491.herokuapp.com";

  static void signup(String email, String password, Function callback){
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

  static Future<MealPlan> fetchMeals() async{
     http.Response response = await http.get('$_baseUrl/meals/generate');
     MealPlan data = MealPlan.fromJson(json.decode(response.body));
     return data;
  }


}
import 'dart:convert';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/Model/MealPlan.dart';
import 'package:foodster/Model/Recipe.dart';
import 'package:foodster/Model/Serving.dart';
import 'package:foodster/Model/User.dart';
import 'package:foodster/controllers/ui_utils.dart';
import 'package:http/http.dart' as http;

import '../pref_manager.dart';

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


  static Future<MealPlan> fetchMealPlan() async{
    http.Response response = await http.post('$_baseUrl/meals/generate', body: { },
      headers: {
      'Authorization' : 'Bearer ${await PrefManager.getToken()}',
    },);
    print("Fetch Meal Plan Status: ${response.statusCode}");
    MealPlan data = MealPlan.fromJson(json.decode(response.body));
    return data;
  }

  static Future<String> likeRecipe(String recipeName) async{
    http.Response response = await http.post('$_baseUrl/recipes/like/$recipeName', body: { },
      headers: {
        'Authorization' : 'Bearer ${await PrefManager.getToken()}',
      },);
    print("Like Recipe Status: ${response.statusCode}");
    String data = response.body;
    return data;
  }

  static Future<Recipe> fetchRecipe(String recipeName) async{
    print("fetching a $recipeName details");
    http.Response response = await http.get('$_baseUrl/recipes/$recipeName',
      headers: {
        'Authorization' : 'Bearer ${await PrefManager.getToken()}',
      },);
    print("Fetch Recipe Status: ${response.statusCode}");
    //print(response.body);
    Recipe data = Recipe.fromJson(json.decode(response.body));
    return data;
  }

  static Future<Meal> fetchTopRecipesMeal(int n) async{
    print("fetching top recipes");
    http.Response response = await http.get('$_baseUrl/recipes/top/$n',
      headers: {
        'Authorization' : 'Bearer ${await PrefManager.getToken()}',
      },);
    print("Fetch Top Recipes Status: ${response.statusCode}");
    List<Serving> servings = [];
    List<dynamic> data = json.decode(response.body);
    servings = (data.map((recipe) =>  Recipe.fromJson(recipe).toServing())).toList();
    //print(response.body);
    Meal meal = new Meal(name: "Top $n Recipes", servings:  servings);
    return meal;
  }

  static Future<User> fetchUser() async{
    print("fetching user");
    http.Response response = await http.get('$_baseUrl/users/',
      headers: {
        'Authorization' : 'Bearer ${await PrefManager.getToken()}',
      },);
    print("Fetch User Status: ${response.statusCode}");
    //print(response.body);
    User user = User.fromJson(json.decode(response.body));
    return user;
  }

  static Future<List<Recipe>> fetchLikedRecipes() async{
    print("fetching user liked recipes");
    http.Response response = await http.get('$_baseUrl/users/liked_recipes',
      headers: {
        'Authorization' : 'Bearer ${await PrefManager.getToken()}',
      },);
    print("Fetch Liked Recipes Status: ${response.statusCode}");
    //print(response.body);
    List<Recipe> recipes = [];
    List<dynamic> data = json.decode(response.body);
    recipes = (data.map((recipe) =>  Recipe.fromJson(recipe))).toList();
    return recipes;
  }

  static Future<User> updateUser(Map<String, dynamic> userJson) async{
    print("updating user $userJson" );
    http.Response response = await http.patch('$_baseUrl/users/', body: json.encode(userJson) ,
      headers: {
        'Authorization' : 'Bearer ${await PrefManager.getToken()}',
        'content-type' : 'application/json'
      },);
    print("Update user Status: ${response.statusCode}");
    User user = User.fromJson(json.decode(response.body));
    print(user.preferences);
    return user;
  }






}


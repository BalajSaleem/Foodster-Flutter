import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodster/controllers/pref_manager.dart';
import 'package:foodster/pages/home_page.dart';
import 'package:foodster/pages/recipe_choices_page.dart';
import 'package:foodster/pages/recipe_details_page.dart';
import 'package:foodster/pages/user_page.dart';

import 'package:foodster/controllers/http_caller.dart';
import 'utils/globals.dart' as globals;

import 'pages/login_page.dart';
import 'pages/register_page.dart';

void main() async {
  String start = '';
  WidgetsFlutterBinding.ensureInitialized();
  await PrefManager.getToken().then((String token) {
    start = token == null ? '/login' : '/home';
  });

  globals.numberOfLikedMeals = await HttpCaller.fetchLikedRecipesNumber();
  //start = '/home'; //TODO: REMOVE AT PRODUCTION!

  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.green[300],
        accentColor: Colors.grey[600],
        backgroundColor: Colors.grey[800],
        fontFamily: 'TenorSans',
      ),
      initialRoute: start,
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => SignUp(),
        '/home': (context) => Home(),
        '/user': (context) => UserPage(),
        '/chooseRecipes': (context) => RecipeChoicesPage(),
        '/recipeDetails': (context) => RecipeDetailsPage(),
      }));
}

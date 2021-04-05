import 'package:flutter/material.dart';
import 'package:foodster/Model/Ingredient.dart';
import 'package:foodster/Model/Nutrition.dart';
import 'package:foodster/Model/Preferences.dart';
import 'package:foodster/Model/User.dart';
import 'package:foodster/components/ingredient_list.dart';
import 'package:foodster/components/preferences_card.dart';
import 'package:foodster/components/recipe_list.dart';

import '../Model/Measure.dart';
import '../Model/Recipe.dart';


String tomatoImg = "https://images.unsplash.com/photo-1576856497337-4f2be24683da?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=682&q=80";
String onionImg = "https://images.unsplash.com/photo-1587735243474-5426387356db?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String potatoImg = "https://images.unsplash.com/photo-1578594640334-b71fbed2a406?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
String broccoliImg = "https://images.unsplash.com/photo-1518164147695-36c13dd568f5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String nutImg ="https://images.unsplash.com/photo-1594900689460-fdad3599342c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8cGVhbnV0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
String userImg = "https://images.unsplash.com/photo-1491308056676-205b7c9a7dc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=753&q=80";
String saladImg = "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String saladImg2= "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String saladImg3 = "https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80";
String saladImg4 = "https://images.unsplash.com/photo-1553455860-2fa544e14141?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTZ8fHNhbGFkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
List<String> lorem = ["It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
  "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"] ;

List<Ingredient> likedIngs = [
  Ingredient(name: 'Tomato', imgUrl: tomatoImg ),
  Ingredient(name: 'Onion', imgUrl: onionImg)
];

List<Ingredient> dislikedIngs = [
  Ingredient(name: 'Broccoli', imgUrl: broccoliImg ),
  Ingredient(name: 'Potato', imgUrl: potatoImg)
];

List<Ingredient> allergies = [
  Ingredient(name: 'Kaju', imgUrl: nutImg ),
];

Preferences prefs = Preferences(
  calRange: [1000, 2000],
  fatRange: [20,30],
  carbRange: [100,200],
  protRange: [100,120],
  costRange: [100,200],
  dietType: 'Keto',
  difficulty: 'Easy',
  cookingTime: [10,15],
  restrictions: allergies,
);

Nutrition nutrition1 = Nutrition(base: Measure(unit:"gr", mag: 20), calories: 500, carbs: 99, proteins: 20, fats: 15);
Nutrition nutrition2 = Nutrition(base: Measure(unit:"gr", mag: 40), calories: 897, carbs: 123, proteins: 45, fats: 26);
Nutrition nutrition3 = Nutrition(base: Measure(unit:"gr", mag: 60), calories: 200, carbs: 36, proteins: 18, fats: 13);

List<Recipe> likedRecipe = [
  Recipe(name: 'Tomato Salad', difficulty: 'EASY', prepTime: 20, cookTime: 5,
      imgUrl: saladImg, instructions: lorem, nutrition: nutrition1, estimatedPrice: 80, ingredients: likedIngs ),
  Recipe(name: 'Onion Salad', difficulty: 'HARD', prepTime: 30, cookTime: 2,
      imgUrl: saladImg2, instructions: lorem, nutrition: nutrition2, estimatedPrice: 25, ingredients: likedIngs ),
];

List<Recipe> dislikedRecipe = [
  Recipe(name: 'Brocolli Salad', difficulty: 'MEDIUM', prepTime: 5, cookTime: 5,
      imgUrl: saladImg3, instructions: lorem, nutrition: nutrition1, estimatedPrice: 12, ingredients: dislikedIngs ),
  Recipe(name: 'Potato Salad', difficulty: 'EASY', prepTime: 15, cookTime: 5,
      imgUrl: saladImg4, instructions: lorem, nutrition: nutrition2, estimatedPrice: 36, ingredients: dislikedIngs ),
];



class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {



  User user = User(sId: '1238', name: "Balaj", surname: "Saleem", email: 'balaj@balaj.com',
    password: 'zxcqwer', age: 22, gender: 'Male', height: 174, weight: 66, iV: 1, token: 'zxc5468we',
    imgUrl: userImg, preferences: prefs, allergies: allergies, likedIngredients: likedIngs, dislikedIngredients: dislikedIngs,
    likedRecipes: likedRecipe, dislikedRecipes: dislikedRecipe
    );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(64.0),
                child:
                Image.network(
                  //meal.imgUrl
                  user.imgUrl, //replace this with recipe image
                  height: 128,
                  width: 128,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Text(
              "${user.name} ${user.surname}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400, ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              "${user.email}",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              "${user.gender} of ${user.age} years, ${user.weight} Kgs and ${user.height} cm",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200, ),
            ),
          ),
          Divider(),
          buildHeading(title: "Preferences"),
          PreferencesCard(preferences: user.preferences,),
          Divider(),
          buildHeading(title: "Allergies"),
          IngredientList(ingredients: user.allergies),
          Divider(),
          buildHeading(title: "Liked Ingredients"),
          IngredientList(ingredients: user.likedIngredients),
          Divider(),
          buildHeading(title: "Disliked Ingredients"),
          IngredientList(ingredients: user.dislikedIngredients),
          Divider(),
          buildHeading(title: "Liked Recipes"),
          RecipeList(recipes: user.likedRecipes),
          Divider(),
          buildHeading(title: "Disliked Recipes"),
          RecipeList(recipes: user.dislikedRecipes),
        ],
      ),
    );
  }

  Padding buildHeading({String title}) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, ),
              ),
            ],
          ),
        );
  }
}

import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodster/Model/Ingredient.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/Model/Preferences.dart';
import 'package:foodster/Model/Recipe.dart';


//TODO: MAKE THIS STATEFUL FOR TEXT EDITING CONTROLLERS
class RecipeList extends StatelessWidget {
  const RecipeList({Key key, this.recipes}) : super(key: key);
  final List<Recipe> recipes;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: buildIngredientList(),
        ),
      ),
    );
  }

  Column buildIngredientList() {
    return Column(
      children: recipes
          .map((recipe) => Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(26.0),
          child:
          Image.network(
            //meal.imgUrl
            recipe.imgUrl, //replace this with ingredient image
            height: 48,
            width: 48,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            recipe.name,
            style: TextStyle(color: Colors.grey[400], fontSize: 16),
          ),
        ),
      ]))
          .toList(),
    );
  }
}

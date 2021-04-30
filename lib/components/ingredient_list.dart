import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodster/Model/Ingredient.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/Model/Preferences.dart';
import 'package:foodster/controllers/ui_utils.dart';


String imgUrl = "https://images.unsplash.com/photo-1581375074612-d1fd0e661aeb?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80";

//TODO: MAKE THIS STATEFUL FOR TEXT EDITING CONTROLLERS
class IngredientList extends StatelessWidget {
  const IngredientList({Key key, this.ingredients}) : super(key: key);
  final List<Ingredient> ingredients;


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
      children: ingredients
          .map((ingredient) => Row(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(26.0),
          child:
          Image.network(
            //meal.imgUrl
            imgUrl, //replace this with ingredient image
            height: 48,
            width: 48,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            UiUtils.firstLetterUppercase(ingredient.name) ,
            style: TextStyle(color: Colors.grey[400], fontSize: 16),
          ),
        ),
      ]))
          .toList(),
    );
  }
}

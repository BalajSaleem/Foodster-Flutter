import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/controllers/ui_utils.dart';

class MealCard extends StatelessWidget {
  const MealCard({Key key, this.meal}) : super(key: key);
  final Meal meal;

  final String backupImageAddress =
      "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(4),
                child: Text(
                  meal.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, ),
                ),
              ),
//              Padding(
//                padding: const EdgeInsets.all(4),
//                child: Text("Calories: ${meal.calories}", style: TextStyle(fontSize: 14, color: Colors.grey[300])),
//              ),
              Divider(
                color: Colors.grey,
              ),
              buildRecipeList()
            ],
          ),
        ),
      ),
    );
  }

  Column buildRecipeList() {
    return Column(
      children: meal.servings
          .map((serving) => Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(26.0),
                  child: 
                  Image.network(
                    //meal.imgUrl
                    serving.recipe.imgUrl, //replace this with recipe image
                    height: 48,
                    width: 48,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        serving.recipe.name.trim(),
                        style: TextStyle(color: Colors.grey[400], fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Text(
                            "${UiUtils.firstLetterUppercase(serving.recipe.nutrition.calories.unit)}:  ${(serving.recipe.nutrition.calories.mag)} ".trim(),
                            style: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(width: 30,),
                          Text(
                            "Cook Time: ${(serving.recipe.cookTime)} min".trim(),
                            style: TextStyle(color: Colors.grey[400], fontSize: 14, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]))
          .toList(),
    );
  }
}

import 'package:foodster/Model/Nutrition.dart';

import 'Ingredient.dart';

class Recipe {
  String name;
  String difficulty;
  int prepTime;
  int cookTime;
  String imgUrl;
  List<String> instructions;
  Nutrition nutrition;
  double estimatedPrice;
  List<Ingredient> ingredients;

  Recipe({this.name, this.difficulty, this.prepTime, this.cookTime, this.imgUrl, this.instructions, this.nutrition, this.estimatedPrice, this.ingredients});

  Recipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    difficulty = json['difficulty'];
    prepTime = json['prepTime'];
    cookTime = json['cookTime'];
    imgUrl = json['imgUrl'];
    instructions = json['instructions'].cast<String>();
    nutrition = json['nutrition'] != null ? new Nutrition.fromJson(json['nutrition']) : null;
    estimatedPrice = json['estimatedPrice'];
    if (json['ingredients'] != null) {
      ingredients = new List<Ingredient>();
      json['ingredients'].forEach((v) { ingredients.add(new Ingredient.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['difficulty'] = this.difficulty;
    data['prepTime'] = this.prepTime;
    data['cookTime'] = this.cookTime;
    data['imgUrl'] = this.imgUrl;
    data['instructions'] = this.instructions;
    if (this.nutrition != null) {
      data['nutrition'] = this.nutrition.toJson();
    }
    data['estimatedPrice'] = this.estimatedPrice;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Recipe{name: $name, difficulty: $difficulty, prepTime: $prepTime, cookTime: $cookTime, nutrition: $nutrition, estimatedPrice: $estimatedPrice,}';
  }
}
import 'Ingredient.dart';

class Recipe {
  String name;
  int cookingTime;
  List<Ingredient> ingredients;

  Recipe({this.name, this.cookingTime, this.ingredients});

  Recipe.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    cookingTime = json['cookingTime'];
    if (json['ingredients'] != null) {
      ingredients = new List<Ingredient>();
      json['ingredients'].forEach((v) { ingredients.add(new Ingredient.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['cookingTime'] = this.cookingTime;
    if (this.ingredients != null) {
      data['ingredients'] = this.ingredients.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
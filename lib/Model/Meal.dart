import 'Recipe.dart';
class Meal {
  String name;
  String type;
  int calories;
  List<Recipe> recipes;
  String imgUrl;

  Meal({this.name, this.type, this.calories, this.recipes, this.imgUrl});

  Meal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    calories = json['calories'];
    imgUrl = json['imgUrl'];
    json['recipes'].forEach((v) { recipes.add(new Recipe.fromJson(v)); });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['calories'] = this.calories;
    data['imgUrl'] = this.imgUrl;
    if (this.recipes != null) {
      data['recipes'] = this.recipes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
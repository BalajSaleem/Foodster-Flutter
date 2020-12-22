import 'Recipe.dart';
class Meal {
  String name;
  String type;
  Recipe recipe;

  Meal({this.name, this.type, this.recipe});

  Meal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    recipe = json['recipe'] != null ? new Recipe.fromJson(json['recipe']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.recipe != null) {
      data['recipe'] = this.recipe.toJson();
    }
    return data;
  }
}
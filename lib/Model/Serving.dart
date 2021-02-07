import 'package:foodster/Model/Ingredient.dart';
import 'package:foodster/Model/Measure.dart';
import 'package:foodster/Model/Recipe.dart';

class Serving {
  Recipe recipe;
  Measure measure;
  Serving({this.recipe, this.measure});

  Serving.fromJson(Map<String, dynamic> json) {
    recipe = json['ingredient'] != null ? new Recipe.fromJson(json['recipe']) : null;
    measure = json['measure'] != null ? new Measure.fromJson(json['measure']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.recipe != null) {
      data['ingredient'] = this.recipe.toJson();
    }
    if (this.measure != null) {
      data['measure'] = this.measure.toJson();
    }
    return data;
  }
}
import 'package:foodster/Model/Ingredient.dart';
import 'package:foodster/Model/Measure.dart';

class Edible {
  Ingredient ingredient;
  Measure measure;
  Edible({this.ingredient, this.measure});

  Edible.fromJson(Map<String, dynamic> json) {
    ingredient = json['ingredient'] != null ? new Ingredient.fromJson(json['ingredient']) : null;
    measure = json['measure'] != null ? new Measure.fromJson(json['measure']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.ingredient != null) {
      data['ingredient'] = this.ingredient.toJson();
    }
    if (this.measure != null) {
      data['measure'] = this.measure.toJson();
    }
    return data;
  }
}
import 'package:foodster/Model/Serving.dart';

import 'Recipe.dart';
class Meal {
  String name;
  String type;
  int calories;
  List<Serving> servings;
  String imgUrl;

  Meal({this.name, this.type, this.calories, this.servings, this.imgUrl});

  Meal.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    calories = json['calories'];
    imgUrl = json['imgUrl'];
    if (json['servings'] != null) {
      servings = new List<Serving>();
      json['servings'].forEach((v) { servings.add(new Serving.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['type'] = this.type;
    data['calories'] = this.calories;
    data['imgUrl'] = this.imgUrl;
    if (this.servings != null) {
      data['recipes'] = this.servings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
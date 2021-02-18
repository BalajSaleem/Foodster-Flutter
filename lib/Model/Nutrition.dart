import 'package:foodster/Model/Measure.dart';

class Nutrition {
  Measure base;
  int calories;
  int carbs;
  int proteins;
  int fats;

  Nutrition({this.base, this.calories, this.carbs, this.proteins, this.fats});

  Nutrition.fromJson(Map<String, dynamic> json) {
    base = json['base'] != null ? new Measure.fromJson(json['base']) : null;
    calories = json['calories'];
    carbs = json['carbs'];
    proteins = json['proteins'];
    fats = json['fats'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.base != null) {
      data['base'] = this.base.toJson();
    }
    data['calories'] = this.calories;
    data['carbs'] = this.carbs;
    data['proteins'] = this.proteins;
    data['fats'] = this.fats;
    return data;
  }
}
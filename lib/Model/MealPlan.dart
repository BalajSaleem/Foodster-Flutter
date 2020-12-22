import 'Meal.dart';

class MealPlan {
  List<Meal> meals;

  MealPlan({this.meals});

  MealPlan.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = new List<Meal>();
      json['meals'].forEach((v) { meals.add(new Meal.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meals != null) {
      data['meals'] = this.meals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
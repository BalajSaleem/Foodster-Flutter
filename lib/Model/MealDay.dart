import 'Meal.dart';

class MealDay {
  DateTime date;
  List<Meal> meals;

  MealDay({this.date, this.meals});

  MealDay.fromJson(Map<String, dynamic> json) {
    date = DateTime.parse(json['date']);
    if (json['meals'] != null) {
      meals = new List<Meal>();
      json['meals'].forEach((v) { meals.add(new Meal.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date.toString();
    if (this.meals != null) {
      data['meals'] = this.meals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
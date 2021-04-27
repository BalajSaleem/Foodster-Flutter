import 'package:foodster/Model/Measure.dart';

class Nutrition {

  Measure calories;
  Measure carbs;
  Measure proteins;
  Measure fats;

  Nutrition({ this.calories, this.carbs, this.proteins, this.fats});

  Nutrition.fromJson(Map<String, dynamic> json) {
    calories = json['calories'] != null ? new Measure.fromJson(json['calories']) : null;
    calories = json['carbs'] != null ? new Measure.fromJson(json['carbs']) : null;
    calories = json['proteins'] != null ? new Measure.fromJson(json['proteins']) : null;
    calories = json['fats'] != null ? new Measure.fromJson(json['fats']) : null;


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.calories != null) {
      data['calories'] = this.calories.toJson();
    }
    if (this.carbs != null) {
      data['carbs'] = this.carbs.toJson();
    }
    if (this.proteins != null) {
      data['proteins'] = this.proteins.toJson();
    }
    if (this.fats != null) {
      data['fats'] = this.fats.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Nutrition{ calories: $calories, carbs: $carbs, proteins: $proteins, fats: $fats}';
  }
}
import 'package:foodster/Model/Serving.dart';

class Meal {
  String label;
  List<Serving> servings;

  Meal({this.label, this.servings});

  Meal.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    json['servings'].forEach((v) { servings.add(new Serving.fromJson(v)); });
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.servings != null) {
      data['recipes'] = this.servings.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
import 'package:foodster/Model/MealDay.dart';

class MealPlan {
  int duration;
  String startDate;
  String endDate;
  List<MealDay> plan;

  MealPlan({this.duration, this.startDate, this.endDate, this.plan});

  MealPlan.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    if (json['plan'] != null) {
      plan = new List<MealDay>();
      json['plan'].forEach((v) { plan.add(new MealDay.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = this.duration;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    if (this.plan != null) {
      data['plan'] = this.plan.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
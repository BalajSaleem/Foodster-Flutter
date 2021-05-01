import 'package:foodster/Model/Ingredient.dart';

class Preferences {
  int mealsPerDay;
  int mealPlanDuration;
  List<int> calRange;
  List<int> fatRange;
  List<int> carbRange;
  List<int> protRange;
  List<int> costRange;
  String dietType;
  String difficulty;
  List<Ingredient> restrictions;

  Preferences({this.mealsPerDay, this.mealPlanDuration, this.calRange, this.fatRange, this.carbRange, this.protRange, this.costRange, this.dietType, this.difficulty, this.restrictions});

  Preferences.fromJson(Map<String, dynamic> json) {
    mealsPerDay = json['mealsPerDay'];
    mealPlanDuration = json['mealsPlanDuration'];
    calRange = json['calRange']!= null ? json['calRange'].cast<int>() : [];
    fatRange = json['fatRange']!= null ? json['fatRange'].cast<int>() : [];
    carbRange = json['carbRange']!= null ? json['carbRange'].cast<int>() : [];
    protRange = json['protRange']!= null ? json['protRange'].cast<int>() : [];
    costRange = json['costRange']!= null ? json['costRange'].cast<int>() : [];
    dietType = json['dietType'];
    difficulty = json['difficulty'];
    if (json['restrictions'] != null) {
      restrictions = new List<Ingredient>();
      json['restrictions'].forEach((v) { restrictions.add(new Ingredient.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['calRange'] = this.calRange;
    data['fatRange'] = this.fatRange;
    data['carbRange'] = this.carbRange;
    data['protRange'] = this.protRange;
    data['costRange'] = this.costRange;
    if (this.mealPlanDuration != null)
      data['mealPlanDuration'] = this.mealPlanDuration;
    if (this.mealsPerDay != null)
      data['mealsPerDay'] = this.mealsPerDay;
    if (this.dietType != null)
      data['dietType'] = this.dietType;
    if (this.difficulty != null)
      data['difficulty'] = this.difficulty;
    if (this.restrictions != null) {
      data['restrictions'] = this.restrictions.map((v) => v.toJson()).toList();
    }
    return data;
  }


  @override
  String toString() {
    return 'Preferences{calRange: $calRange, fatRange: $fatRange, carbRange: $carbRange, protRange: $protRange, costRange: $costRange, dietType: $dietType}';
  }

  Map<String, dynamic> toUserJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preferences'] = toJson();
    return data;
  }


}
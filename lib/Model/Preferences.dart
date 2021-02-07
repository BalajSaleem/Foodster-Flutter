import 'package:foodster/Model/Ingredient.dart';

class Preferences {
  List<int> calRange;
  List<int> fatRange;
  List<int> carbRange;
  List<int> protRange;
  List<int> costRange;
  List<String> dietType;
  List<String> difficulty;
  List<int> cookingTime;
  List<Ingredient> restrictions;

  Preferences({this.calRange, this.fatRange, this.carbRange, this.protRange, this.costRange, this.dietType, this.difficulty, this.cookingTime, this.restrictions});

  Preferences.fromJson(Map<String, dynamic> json) {
    calRange = json['calRange'].cast<int>();
    fatRange = json['fatRange'].cast<int>();
    carbRange = json['carbRange'].cast<int>();
    protRange = json['protRange'].cast<int>();
    costRange = json['costRange'].cast<int>();
    dietType = json['dietType'].cast<String>();
    difficulty = json['difficulty'].cast<String>();
    cookingTime = json['cookingTime'].cast<int>();
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
    data['dietType'] = this.dietType;
    data['difficulty'] = this.difficulty;
    data['cookingTime'] = this.cookingTime;
    if (this.restrictions != null) {
      data['restrictions'] = this.restrictions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
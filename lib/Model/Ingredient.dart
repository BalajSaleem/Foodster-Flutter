import 'package:foodster/Model/IngredientBase.dart';
import 'package:foodster/Model/Nutrition.dart';

import 'Measure.dart';

class Ingredient {
  String name;
  String imgUrl;
  double estimatedPrice;
  Nutrition nutrition;
  Measure measure;
  String description;
  dynamic ingBase;

  Ingredient({this.name, this.imgUrl, this.estimatedPrice, this.nutrition, this.measure, this.description, this.ingBase});

  Ingredient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    imgUrl = json['imgUrl'];
    estimatedPrice = json['price'];
    nutrition = json['nutrition'] != null ? new Nutrition.fromJson(json['nutrition']) : null;
    measure = json['measure'] != null ? new Measure.fromJson(json['measure']) : null;
    ingBase = (json['ingredient'] != null && !(json['ingredient'] is String)  ) ? new IngredientBase.fromJson(json['ingredient']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.estimatedPrice;
    if (this.measure != null) {
      data['measure'] = this.measure.toJson();
    }
    if (this.nutrition != null) {
      data['nutrition'] = this.nutrition.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Ingredient{name: $name, estimatedPrice: $estimatedPrice}';
  }
}
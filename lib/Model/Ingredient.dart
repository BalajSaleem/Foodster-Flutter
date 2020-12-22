import 'Measure.dart';

class Ingredient {
  String name;
  double price;
  Measure measure;

  Ingredient({this.name, this.price, this.measure});

  Ingredient.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    measure = json['measure'] != null ? new Measure.fromJson(json['measure']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    if (this.measure != null) {
      data['measure'] = this.measure.toJson();
    }
    return data;
  }
}
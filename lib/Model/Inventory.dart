import 'package:foodster/Model/Edible.dart';

class Inventory {
  List<Edible> inventory;

  Inventory({this.inventory});

  Inventory.fromJson(Map<String, dynamic> json) {
    if (json['inventory'] != null) {
      inventory = new List<Edible>();
      json['inventory'].forEach((v) { inventory.add(new Edible.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.inventory != null) {
      data['inventory'] = this.inventory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

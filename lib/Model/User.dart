import 'package:foodster/Model/Ingredient.dart';
import 'package:foodster/Model/Preferences.dart';
import 'package:foodster/Model/Recipe.dart';

class User {
  String sId;
  String email;
  String password;
  String gender;
  double height;
  double weight;
  int iV;
  String token;
  String imgUrl;

  Preferences preferences;
  List<Ingredient> allergies;
  List<Recipe> likedRecipes;
  List<Recipe> dislikedRecipes;
  List<Ingredient> likedIngredients;
  List<Ingredient> dislikedIngredients;

  User({this.sId, this.email, this.password, this.gender, this.height, this.weight, this.iV, this.token, this.imgUrl});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    height = json['height'];
    weight = json['weight'];
    iV = json['__v'];
    token = json['token'];
    imgUrl = json['imgUrl'];
    preferences = json['preferences'] != null ? new Preferences.fromJson(json['preferences']) : null;
    json['allergies'].forEach((v) { allergies.add(new Ingredient.fromJson(v)); });
    json['likedRecipes'].forEach((v) { likedRecipes.add(new Recipe.fromJson(v)); });
    json['dislikedRecipes'].forEach((v) { dislikedRecipes.add(new Recipe.fromJson(v)); });
    json['likedIngredients'].forEach((v) { likedIngredients.add(new Ingredient.fromJson(v)); });
    json['dislikedIngredients'].forEach((v) { dislikedIngredients.add(new Ingredient.fromJson(v)); });

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['gender'] = this.gender;
    data['__v'] = this.iV;
    data['token'] = this.token;
    data['imgUrl'] = this.imgUrl;

    if (this.preferences != null) {
      data['preferences'] = this.preferences.toJson();
    }

    if (this.allergies != null) {
      data['allergies'] = this.allergies.map((v) => v.toJson()).toList();
    }

    if (this.likedRecipes != null) {
      data['likedRecipes'] = this.likedRecipes.map((v) => v.toJson()).toList();
    }

    if (this.dislikedRecipes != null) {
      data['dislikedRecipes'] = this.dislikedRecipes.map((v) => v.toJson()).toList();
    }

    if (this.likedIngredients != null) {
      data['likedIngredients'] = this.likedIngredients.map((v) => v.toJson()).toList();
    }

    if (this.dislikedIngredients != null) {
      data['dislikedIngredients'] = this.dislikedIngredients.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
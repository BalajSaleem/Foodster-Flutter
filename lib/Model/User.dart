import 'package:foodster/Model/Ingredient.dart';
import 'package:foodster/Model/Preferences.dart';
import 'package:foodster/Model/Recipe.dart';

class User {
  String sId;
  String name;
  String surname;
  String email;
  String password;
  int age;
  String gender;
  int height;
  int weight;
  int iV;
  String token;
  String imgUrl;

  Preferences preferences;
  List<String> allergies;
  List<Recipe> likedRecipes;
  List<Recipe> dislikedRecipes;
  List<Ingredient> likedIngredients;
  List<Ingredient> dislikedIngredients;

  User(
      {this.sId,
      this.email,
      this.name,
      this.surname,
      this.age,
      this.password,
      this.gender,
      this.height,
      this.weight,
      this.iV,
      this.token,
      this.imgUrl,
      this.preferences,
      this.allergies,
      this.likedIngredients,
      this.dislikedIngredients,
      this.likedRecipes,
      this.dislikedRecipes});

  User.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    email = json['email'];
    name = json['name'];
    surname = json['surname'];
    password = json['password'];
    gender = json['gender'] != null ? json['gender'] : null;
    age = json['age'] != null ? json['age'] : null;
    height = json['height'] != null ? json['height'] : null;
    weight = json['weight'] != null ? json['weight'] : null;
    iV = json['__v'];
    token = json['token'];
    imgUrl = json['imgUrl'];
    preferences = json['preferences'] != null
        ? new Preferences.fromJson(json['preferences'])
        : null;
    allergies =
        json['allergies'] != null ? json['allergies'].cast<String>() : [];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['password'] = this.password;
    data['height'] = this.height;
    data['age'] = this.age;
    data['weight'] = this.weight;
    data['gender'] = this.gender;
    data['imgUrl'] = this.imgUrl;

    if (this.preferences != null) {
      data['preferences'] = this.preferences.toJson();
    }

    data['allergies'] = this.allergies;

    if (this.likedRecipes != null) {
      data['likedRecipes'] = this.likedRecipes.map((v) => v.toJson()).toList();
    }

    if (this.likedIngredients != null) {
      data['likedIngredients'] =
          this.likedIngredients.map((v) => v.toJson()).toList();
    }

    return data;
  }

  @override
  String toString() {
    return 'User{name: $name, surname: $surname, email: $email, password: $password, age: $age, gender: $gender, height: $height, weight: $weight, preferences: $preferences, allergies: $allergies}';
  }
}


import 'package:flutter/material.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/components/busy_spinkit.dart';
import 'package:foodster/components/meal_card.dart';
import 'package:foodster/controllers/http_caller.dart';

class RecipePage extends StatefulWidget {
  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  Meal meal;
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTopRecipes();
  }

  void fetchTopRecipes( {int n = 30} ) async {
    Meal tempMeal = await HttpCaller.fetchTopRecipesMeal(n);
    setState(() {
      meal = tempMeal;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: !isLoading ?  MealCard( meal: meal,) : Loader()
    );
  }
}

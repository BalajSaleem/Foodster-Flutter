import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:foodster/Model/Ingredient.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/Model/Measure.dart';
import 'package:foodster/Model/Nutrition.dart';
import 'package:foodster/Model/Recipe.dart';
import 'package:foodster/Model/Serving.dart';
import 'package:foodster/components/meal_card.dart';

String tomatoImg = "https://images.unsplash.com/photo-1576856497337-4f2be24683da?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=682&q=80";
String onionImg = "https://images.unsplash.com/photo-1587735243474-5426387356db?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String potatoImg = "https://images.unsplash.com/photo-1578594640334-b71fbed2a406?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
String broccoliImg = "https://images.unsplash.com/photo-1518164147695-36c13dd568f5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String nutImg ="https://images.unsplash.com/photo-1594900689460-fdad3599342c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8cGVhbnV0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
String userImg = "https://images.unsplash.com/photo-1491308056676-205b7c9a7dc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=753&q=80";
String saladImg = "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String saladImg2= "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String saladImg3 = "https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80";
String saladImg4 = "https://images.unsplash.com/photo-1553455860-2fa544e14141?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTZ8fHNhbGFkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
List<String> lorem = ["It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
  "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"] ;

List<Ingredient> likedIngs = [
  Ingredient(name: 'Tomato', imgUrl: tomatoImg ),
  Ingredient(name: 'Onion', imgUrl: onionImg)
];

List<Ingredient> dislikedIngs = [
  Ingredient(name: 'Broccoli', imgUrl: broccoliImg ),
  Ingredient(name: 'Potato', imgUrl: potatoImg)
];

List<Ingredient> allergies = [
  Ingredient(name: 'Kaju', imgUrl: nutImg ),
];


Nutrition nutrition1 = Nutrition(base: Measure(unit:"gr", mag: 20), calories: 500, carbs: 99, proteins: 20, fats: 15);
Nutrition nutrition2 = Nutrition(base: Measure(unit:"gr", mag: 40), calories: 897, carbs: 123, proteins: 45, fats: 26);
Nutrition nutrition3 = Nutrition(base: Measure(unit:"gr", mag: 60), calories: 200, carbs: 36, proteins: 18, fats: 13);

List<Recipe> likedRecipe = [
  Recipe(name: 'Tomato Salad', difficulty: 'EASY', prepTime: 20, cookTime: 5,
      imgUrl: saladImg, instructions: lorem, nutrition: nutrition1, estimatedPrice: 80, ingredients: likedIngs ),
  Recipe(name: 'Onion Salad', difficulty: 'HARD', prepTime: 30, cookTime: 2,
      imgUrl: saladImg2, instructions: lorem, nutrition: nutrition2, estimatedPrice: 25, ingredients: likedIngs ),
];

List<Recipe> dislikedRecipe = [
  Recipe(name: 'Brocolli Salad', difficulty: 'MEDIUM', prepTime: 5, cookTime: 5,
      imgUrl: saladImg3, instructions: lorem, nutrition: nutrition1, estimatedPrice: 12, ingredients: dislikedIngs ),
  Recipe(name: 'Potato Salad', difficulty: 'EASY', prepTime: 15, cookTime: 5,
      imgUrl: saladImg4, instructions: lorem, nutrition: nutrition2, estimatedPrice: 36, ingredients: dislikedIngs ),
];

List<Serving> breakfastServings = [
  Serving(recipe: likedRecipe[0], measure: Measure(unit:"bowl", mag: 1)),
];

List<Serving> lunchServings = [
  Serving(recipe: likedRecipe[0], measure: Measure(unit:"bowl", mag: 1)),
  Serving(recipe: dislikedRecipe[1], measure: Measure(unit:"bowl", mag: 1)),
];

List<Serving> dinnerServings = [
  Serving(recipe: likedRecipe[0], measure: Measure(unit:"bowl", mag: 1)),
  Serving(recipe: likedRecipe[1], measure: Measure(unit:"plate", mag: 1)),
  Serving(recipe: dislikedRecipe[1], measure: Measure(unit:"bowl", mag: 1)),
];



class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  List<Meal> meals =[
    Meal(label: "Breakfast", servings: breakfastServings),
    Meal(label: "Lunch", servings: lunchServings),
    Meal(label: "Dinner", servings: dinnerServings),
  ];

//  Future<List<Meal>> _handleMealGeneration() async {
//    var wrapper = {'statusCode': -1};
//    List<Map<String, dynamic>> list = await HttpCaller.generateMeals(await PrefManager.getToken(), wrapper);
//
//    if(list == null) {
//      // token expired, but I need to double check if 401 is the right code for that
//      if(wrapper['statusCode'] == 401){
//        print('token expired');
//        UiUtils.showToast('Your session expired!');
//        logout(context);
//      }
//      return [];
//    }
//
//    List<Meal> newMeals = [];
//
//    // What is supposed to happen here:
//    // for(Map<String, dynamic> mealJson in list){
//    //    newMeals.add(Meal.fromJson(mealJsonObject));
//    // }
//    //
//    // return newMeals;
//    // but the communication between what we needed and what we got was
//    // a bit flawed :|
//
//    // Everything behind this point should be removed after we clean the code up
//    // because it is borderline hardcoded
//
//    String link = "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
//    var links = [
//        "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F614043.jpg",
//        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQXW4P9AcnF5R_b29IeXSCUFKuHbojoajrLA&usqp=CAU",
//        "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F226134.jpg"
//    ];
//
//    var dict = {
//     0 : 'breakfast',
//     1 : 'lunch',
//     2 : 'dinner',
//    };
//
//    Map<String, dynamic> json = list[0];
//    for( int i = 0; i < 3; i++){
//      newMeals.add(Meal(
//            name: UiUtils.firstLetterUppercase(dict[i]),
//            type: dict[i][0].toLowerCase(),
//            calories: json[dict[i]]['nutritions']['calories'],
//            recipes: [Recipe(name: json[dict[i]]['name'])],
//            imgUrl: links[i]
//          ));
//    }
//    return newMeals;
//  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) =>  SingleChildScrollView (
          //padding: EdgeInsets.all(12),
          child:
          Column(
            children: [
            buildDatePicker(context),
//            meals.isEmpty?
//            BigButton(text: "Add Meals" , onClick: () async {
//              List<Meal> list = await _handleMealGeneration();
//              setState(() {
//                meals = list;
//            });
//              }):
            Column(
              children: meals.map((meal) => MealCard(meal: meal,)).toList(),
            )
                //
          ],)
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return DatePicker(
      DateTime.now().subtract(Duration(days: 3)),
      height: 92,
      daysCount: 14,
      initialSelectedDate: DateTime.now(),
      dayTextStyle: TextStyle(color: Colors.grey, fontSize: 12),
      monthTextStyle: TextStyle(color: Colors.grey, fontSize: 12),
      dateTextStyle: TextStyle(color: Colors.grey, fontSize: 18),
      selectionColor: Colors.greenAccent,
//      onDateChange: (date) async {
//        List<Meal> list = await _handleMealGeneration();
//        setState(() {
//        meals = list;
//        });
//      },
    );

  }
}

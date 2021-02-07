import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/Model/Recipe.dart';
import 'package:foodster/components/big_button.dart';
import 'package:foodster/components/meal_card.dart';
import 'package:foodster/controllers/http_caller.dart';
import 'package:foodster/controllers/logout.dart';
import 'package:foodster/controllers/ui_utils.dart';

import '../controllers/pref_manager.dart';


class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  List<Meal> meals =[
    // Meal(name: "Breakfast", type: 'b', calories: 999 , recipes: [ Recipe(name: "Omelet"), Recipe(name: "Milkshake") ] ),
    // Meal(name: "Lunch", type: 'l', calories: 788, recipes: [ Recipe(name: "Steak"), Recipe(name: "Tuna Sandwich"), Recipe(name: "Boza") ] ),
    // Meal(name: "Dinner", type: 'd', calories: 493, recipes: [ Recipe(name: "Fruit Salad"), Recipe(name: "Nuts") ] )
  ];

  Future<List<Meal>> _handleMealGeneration() async {
    var wrapper = {'statusCode': -1};
    List<Map<String, dynamic>> list = await HttpCaller.generateMeals(await PrefManager.getToken(), wrapper);

    if(list == null) {
      // token expired, but I need to double check if 401 is the right code for that
      if(wrapper['statusCode'] == 401){
        print('token expired');
        UiUtils.showToast('Your session expired!');
        logout(context);
      }
      return [];
    }

    List<Meal> newMeals = [];

    // What is supposed to happen here:
    // for(Map<String, dynamic> mealJson in list){
    //    newMeals.add(Meal.fromJson(mealJsonObject));
    // }
    //
    // return newMeals;
    // but the communication between what we needed and what we got was
    // a bit flawed :|

    // Everything behind this point should be removed after we clean the code up
    // because it is borderline hardcoded

    String link = "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
    var links = [
        "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F614043.jpg",
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQXW4P9AcnF5R_b29IeXSCUFKuHbojoajrLA&usqp=CAU",
        "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fimages.media-allrecipes.com%2Fuserphotos%2F226134.jpg"
    ];

    var dict = {
     0 : 'breakfast',
     1 : 'lunch',
     2 : 'dinner',
    };

    Map<String, dynamic> json = list[0];
    for( int i = 0; i < 3; i++){
      newMeals.add(Meal(
            name: UiUtils.firstLetterUppercase(dict[i]),
            type: dict[i][0].toLowerCase(),
            calories: json[dict[i]]['nutritions']['calories'],
            recipes: [Recipe(name: json[dict[i]]['name'])],
            imgUrl: links[i]
          ));
    }
    return newMeals;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) =>  SingleChildScrollView (
          //padding: EdgeInsets.all(12),
          child:
          Column(
            children: [
            buildDatePicker(context),
            meals.isEmpty?
            BigButton(text: "Add Meals" , onClick: () async {
              List<Meal> list = await _handleMealGeneration();
              setState(() {
                meals = list;
            });
              }):
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
      onDateChange: (date) async {
        List<Meal> list = await _handleMealGeneration();
        setState(() {
        meals = list;
        });
      },
    );

  }
}

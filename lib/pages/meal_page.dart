import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/Model/MealPlan.dart';
import 'package:foodster/components/big_button.dart';
import 'package:foodster/components/busy_spinkit.dart';
import 'package:foodster/components/meal_card.dart';
import 'package:foodster/controllers/http_caller.dart';
import 'package:foodster/controllers/ui_utils.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  MealPlan mealPlan;
  List<Meal> meals = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //fetchMeals();
    //fetch the meals
  }

  void fetchMeals() async {
    setState(() {
      isLoading = true;
    });
    MealPlan mp = await HttpCaller.fetchMealPlan();
    //print(mp);
    setState(() {
      mealPlan = mp;
      meals = mp.plan[0].meals;
    });
  }

  void setMeals(DateTime date) {
    bool found = false;
    mealPlan.plan.forEach((mealDay) {
      if (mealDay.date.day.compareTo(date.day) == 0) {
        //print("found a mealday for : ${mealDay.date}");
        setState(() {
          meals = mealDay.meals;
          //meals = [];
        });
        found = true;
      }
    });
    if (!found)
      UiUtils.showToast(
          "Meal Day for ${UiUtils.dateToString(date)} could not be found");
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => SingleChildScrollView(
          //padding: EdgeInsets.all(12),
          child: Column(
        children: [
          buildDatePicker(context),
          (meals.isEmpty)
              ? (!isLoading)
                  ? BigButton(text: "Add Meals", onClick: fetchMeals)
                  : Loader()
              : Column(
                  children: meals
                      .map((meal) => MealCard(
                            meal: meal,
                          ))
                      .toList(),
                )
          //
        ],
      )),
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
      onDateChange: (date) {
        setMeals(date);
      },
    );
  }
}

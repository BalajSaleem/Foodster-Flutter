import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/Model/MealPlan.dart';
import 'package:foodster/components/big_button.dart';
import 'package:foodster/components/busy_spinkit.dart';
import 'package:foodster/components/meal_card.dart';
import 'package:foodster/controllers/http_caller.dart';
import 'package:foodster/controllers/ui_utils.dart';

import '../Model/MealPlan.dart';
import '../controllers/pref_manager.dart';
import '../controllers/ui_utils.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  MealPlan mealPlan;
  List<Meal> meals = [];
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkCacheForMealPlan();
  }

  void checkCacheForMealPlan() async {
    print("checking cache for meal plan");
    setState(() {
      isLoading = true;
    });

    // Get meal plan from local cache if a meal plan exists
    MealPlan mp = await PrefManager.getActiveMealPlan();
    int planDay = getMealsIndexForDay(mp);

    // no cached meal plan, or no mealday for today
    if(mp == null || planDay == -1) {
      setState(() {
        isLoading = false;
      });
    }
    else {
      // populate page if mealplan is cached
      setState(() {
        mealPlan = mp;
        meals = mp.plan[planDay].meals;
      });
    }
  }

  void fetchMeals() async {
    print("fetching meal plan");
    setState(() {
      isLoading = true;
    });

    UiUtils.showToast("We are generating a meal plan for you");

    MealPlan mp = await HttpCaller.fetchMealPlan();
    PrefManager.storeActiveMealPlan(mp);

    print("MealPlan: $mp");

    setState(() {
      mealPlan = mp;
      meals = mp.plan[0].meals;
    });
  }

  int getMealsIndexForDay(MealPlan mp, [DateTime date]){
    if(mp == null)
      return -1;

    if(date == null){
      date = DateTime.now();
    }

    int resIndex = -1;
    mp.plan.asMap().forEach((index, mealDay) {
      if (mealDay.date.day.compareTo(date.day) == 0) {
        resIndex = index;
      }
    });

    return resIndex;
  }

  void setMeals(DateTime date) {
    int mealIndex = getMealsIndexForDay(mealPlan, date);

    if(mealIndex != -1) {
      setState(() {
        meals = mealPlan.plan[mealIndex].meals;
        //meals = [];
      });
    }
    else
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

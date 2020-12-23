import 'package:flutter/material.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/Model/Recipe.dart';
import 'package:foodster/components/meal_card.dart';
//import 'package:horizontal_center_date_picker/datepicker_controller.dart';
//import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';
//import 'package:horizontal_calendar/horizontal_calendar.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';


class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {


  List<Meal> meals =[
    Meal(name: "Breakfast", type: 'b', calories: 999 , recipes: [ Recipe(name: "Omelet"), Recipe(name: "Milkshake") ] ),
    Meal(name: "Lunch", type: 'l', calories: 788, recipes: [ Recipe(name: "Steak"), Recipe(name: "Tuna Sandwich"), Recipe(name: "Boza") ] ),
    Meal(name: "Dinner", type: 'd', calories: 493, recipes: [ Recipe(name: "Fruit Salad"), Recipe(name: "Nuts") ] )
  ];


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) =>  SingleChildScrollView (
          //padding: EdgeInsets.all(12),
          child:
          Column(children: [
            buildDatePicker(context),
            Column(
              children: meals.map((meal) => MealCard(meal: meal,)).toList(),
            )
          ],)
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    // return HorizontalDatePickerWidget(
    //         startDate: DateTime.now().subtract(Duration(days: 7)),
    //         endDate: DateTime.now().add(Duration(days: 7)),
    //         normalColor: Colors.grey[800],
    //         disabledColor: Colors.grey[800],
    //         disabledTextColor: Colors.grey[600],
    //         selectedDate: DateTime.now(),
    //         selectedColor: Colors.greenAccent,
    //         widgetWidth: MediaQuery.of(context).size.width,
    //         datePickerController: DatePickerController(),
    //         onValueSelected: (date) {
    //           print('selected = ${date.toIso8601String()}');
    //         },
    //       );

    return DatePicker(
      DateTime.now().subtract(Duration(days: 3)),
      height: 92,
      daysCount: 14,
      initialSelectedDate: DateTime.now(),
      dayTextStyle: TextStyle(color: Colors.grey, fontSize: 12),
      monthTextStyle: TextStyle(color: Colors.grey, fontSize: 12),
      dateTextStyle: TextStyle(color: Colors.grey, fontSize: 18),
      selectionColor: Colors.greenAccent,
      onDateChange: (date) => print(
        date.toString(),
      ),
    );

  }
}

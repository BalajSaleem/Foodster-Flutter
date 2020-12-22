import 'package:flutter/material.dart';
//import 'package:horizontal_center_date_picker/datepicker_controller.dart';
//import 'package:horizontal_center_date_picker/horizontal_date_picker.dart';
import 'package:horizontal_calendar/horizontal_calendar.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) =>  SingleChildScrollView (
          padding: EdgeInsets.all(12),
          child:
          Column(children: [
            buildDatePicker(context),
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

    return HorizontalCalendar(
      date: DateTime.now().add(Duration(days: 7)),
      textColor: Colors.grey,
      backgroundColor: Colors.grey[800],
      selectedColor: Colors.greenAccent,
      onDateSelected: (date) => print(
        date.toString(),
      ),
    );

  }
}

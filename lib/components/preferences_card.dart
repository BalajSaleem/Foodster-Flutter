import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/Model/Preferences.dart';


//TODO: MAKE THIS STATEFUL FOR TEXT EDITING CONTROLLERS
class PreferencesCard extends StatelessWidget {
  const PreferencesCard({Key key, this.preferences}) : super(key: key);
  final Preferences preferences;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: buildPreferences(),
        ),
      ),
    );
  }

  Column buildPreferences() {
    return Column(
      children:[
        buildPreference("Cost Range", "TL", preferences.costRange[0], preferences.costRange[1]),
        buildPreference("Cooking Time", "min", preferences.cookingTime[0], preferences.cookingTime[1], ),
        buildPreference("Calorie Range", "KCal", preferences.calRange[0], preferences.calRange[1]),
        buildPreference("Fat Range", "gr", preferences.fatRange[0], preferences.fatRange[1]),
        buildPreference("Carbohydrate Range", "gr", preferences.carbRange[0], preferences.carbRange[1]),
        buildPreference("Protein Range", "gr", preferences.protRange[0], preferences.protRange[1]),
      ]
    );
  }

  Row buildPreference(String fieldName, String unit, int from, int to) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(flex: 5, child: Text(fieldName, style: TextStyle(color: Colors.grey[400], fontSize: 16, fontWeight: FontWeight.w300),)),
          Expanded(
            flex: 2,
            child: TextFormField(
              initialValue: "$from",
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'From ($unit)',
                  labelStyle: TextStyle(fontSize: 14),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
            ),
          ),
          SizedBox(
            width: 24,
          ),
          Expanded(
            flex: 2,
            child: TextFormField(
              initialValue: "$to",
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: 'To ($unit)',
                  labelStyle: TextStyle(fontSize: 14),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
            ),
          ),
        ],
      );
  }
}

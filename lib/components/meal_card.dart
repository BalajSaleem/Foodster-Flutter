import 'package:flutter/material.dart';
import 'package:foodster/Model/Meal.dart';

class MealCard extends StatelessWidget {
  const MealCard({Key key, this.meal}) : super(key: key);
  final Meal meal;

  String backupImageAddress = "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text("BREAKFAST"),
          Text("Calories: 788"),
          Divider(color: Colors.grey,),

          Row(
            children: [
              Image.network(
                backupImageAddress,
                height: 24,
                width: 24,
              )
            ]
          )

        ],
      ),
    );
  }
}

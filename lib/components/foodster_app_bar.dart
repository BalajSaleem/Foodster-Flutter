import 'package:flutter/material.dart';
import 'package:foodster/controllers/logout.dart';

class FoodsterAppBar extends StatelessWidget {
  const FoodsterAppBar({
    Key key,
    @required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Foodster'),
      centerTitle: true,
      backgroundColor: Colors.greenAccent,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => logout(context), //logout here
              child: Icon(
                Icons.exit_to_app,
                size: 26.0,
              ),
            )
        ),
      ],
    );
  }
}
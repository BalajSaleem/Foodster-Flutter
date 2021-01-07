import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  BigButton(this.text, this.onClick);
  final String text;
  final VoidCallback onClick;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        padding: EdgeInsets.fromLTRB(158, 0, 158, 0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: Colors.green,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onClick,
        elevation: 7.0,
      );
    }
}

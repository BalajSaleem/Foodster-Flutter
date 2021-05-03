import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  BigButton({this.text, this.onClick});

  final String text;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              // padding: EdgeInsets.fromLTRB(158, 0, 158, 0),
              //https://stackoverflow.com/questions/50014342/button-width-match-parent
              elevation: 7.0),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: onClick,
        ));
  }
}

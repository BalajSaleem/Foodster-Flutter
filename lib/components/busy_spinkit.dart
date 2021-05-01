import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SpinKitWave(
      color: Colors.greenAccent,
      size: 30,
    );
  }
}

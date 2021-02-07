import 'package:flutter/material.dart';
import 'package:foodster/Model/User.dart';


class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {

  User user = User(sId: '1238', email: 'balaj@balaj.com',
    password: 'zxcqwer', gender: 'Male', height: 174, weight: 66, iV: 1, token: 'zxc5468we'  );


  @override
  Widget build(BuildContext context) {
    return Container(


    );
  }
}

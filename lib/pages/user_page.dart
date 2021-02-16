import 'package:flutter/material.dart';
import 'package:foodster/Model/Ingredient.dart';
import 'package:foodster/Model/Preferences.dart';
import 'package:foodster/Model/User.dart';


String tomatoImg = "https://images.unsplash.com/photo-1576856497337-4f2be24683da?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=682&q=80";
String onionImg = "https://images.unsplash.com/photo-1587735243474-5426387356db?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String potatoImg = "https://images.unsplash.com/photo-1578594640334-b71fbed2a406?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
String broccoliImg = "https://images.unsplash.com/photo-1518164147695-36c13dd568f5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String nutImg ="https://images.unsplash.com/photo-1594900689460-fdad3599342c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8cGVhbnV0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {



  List<Ingredient> likedIngs = [
    Ingredient(name: 'Tomato', imgUrl: tomatoImg ),
    Ingredient(name: 'Onion', imgUrl: onionImg)
  ];

  List<Ingredient> dislikedIngs = [
    Ingredient(name: 'Broccoli', imgUrl: broccoliImg ),
    Ingredient(name: 'Potato', imgUrl: potatoImg)
  ];

  List<Ingredient> allergies = [
    Ingredient(name: 'Kaju', imgUrl: nutImg ),
  ];

  Preferences prefs = Preferences(
    calRange: [1000, 2000],
    fatRange: [],
    carbRange: [],
    protRange: [],
    costRange: [],
    dietType: '',
    difficulty: '',
    cookingTime: [],
    restrictions: allergies,

  )


  User user = User(sId: '1238', email: 'balaj@balaj.com',
    password: 'zxcqwer', gender: 'Male', height: 174, weight: 66, iV: 1, token: 'zxc5468we'  );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Container(


    );
  }
}

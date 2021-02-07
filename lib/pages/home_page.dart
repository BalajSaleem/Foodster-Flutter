
import 'package:flutter/material.dart';
import 'package:foodster/controllers/pref_manager.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'meal_page.dart';
import 'package:foodster/controllers/logout.dart';

class Home extends StatefulWidget {
  //const Home({ this.user}) ;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedNavIndex = 2;
  Widget loadedWidget = MealPage();
  final GlobalKey<ScrollableState> globalScrollKey = new GlobalKey<ScrollableState>();

  // void fetchAllEvents() async{
  //   http.Response response = await http.get('$baseUrl/events/');
  //   List<dynamic> data = json.decode(response.body);
  //   setState(() {
  //     activities = (data.map((activity) => Activity.fromJson(activity))).toList();
  //   });
  // }

  void _showToast(BuildContext context,String message) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }


  //Navbar navigation
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
      switch (_selectedNavIndex) {
        case 0:

          break;

        case 1:

          break;
        case 2:

          break;
      }


  }

  @override
  void initState() {
    super.initState();
    _onNavItemTapped(_selectedNavIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: loadedWidget,
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  AppBar buildAppBar() {
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

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      items:
      const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          title: Text('Grocery'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.food_bank),
          title: Text('Meals'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.kitchen),
          title: Text('Recipe'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assessment),
          title: Text('Stats'),
        ),
      ],
      currentIndex: _selectedNavIndex,
      selectedItemColor: Colors.greenAccent,
      onTap: _onNavItemTapped,
    );
  }

  Future<void> _showDialog({String title, String body}) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(body),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
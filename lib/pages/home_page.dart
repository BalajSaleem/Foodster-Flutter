import 'package:flutter/material.dart';
import 'package:foodster/Model/Recipe.dart';
import 'package:foodster/controllers/http_caller.dart';
import 'package:foodster/pages/recipes_page.dart';
import 'package:foodster/pages/recipe_choices_page.dart';
import 'package:foodster/pages/user_page.dart';
import 'meal_page.dart';
import 'package:foodster/controllers/logout.dart';
import '../utils/globals.dart' as globals;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedNavIndex = 1;


  bool hasInitialSelections = (globals.numberOfLikedMeals > 0);

  final GlobalKey<ScrollableState> globalScrollKey = new GlobalKey<ScrollableState>();

  //Navbar navigation
  void _onNavItemTapped(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  void initState(){
    super.initState();
    _onNavItemTapped(_selectedNavIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IndexedStack(
          children: [
            UserPage(),
            hasInitialSelections ? MealPage() : RecipeChoicesPage(onRecipesSelected: addInitialRecipeSelections,),
            RecipePage(),
          ],
          index: _selectedNavIndex,
        ),
      ),
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
          icon: Icon(Icons.fastfood),
          title: Text('Meals'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.kitchen),
          title: Text('Recipe'),
        ),
      ],
      currentIndex: _selectedNavIndex,
      selectedItemColor: Colors.greenAccent,
      onTap: _onNavItemTapped,
    );
  }

  void addInitialRecipeSelections(List<Recipe> recipes){
    setState(() {
      hasInitialSelections = true;
    });
    recipes.forEach((recipe) {
      likeRecipe(recipe.name);
    });
  }

  void likeRecipe(String recipeName) async {
    String result = await HttpCaller.likeRecipe(recipeName, contextForTokenExpirationHandling: context);
    print(result);
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
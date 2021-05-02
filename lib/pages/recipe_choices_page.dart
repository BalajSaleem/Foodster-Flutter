import 'package:flutter/material.dart';
import 'package:foodster/Model/Ingredient.dart';
import 'package:foodster/Model/Measure.dart';
import 'package:foodster/Model/Nutrition.dart';
import 'package:foodster/Model/Recipe.dart';
import 'package:foodster/components/big_button.dart';
import 'package:foodster/components/busy_spinkit.dart';
import 'package:foodster/components/recipe_card.dart';
import 'package:foodster/controllers/http_caller.dart';


String tomatoImg = "https://images.unsplash.com/photo-1576856497337-4f2be24683da?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=682&q=80";
String onionImg = "https://images.unsplash.com/photo-1587735243474-5426387356db?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String potatoImg = "https://images.unsplash.com/photo-1578594640334-b71fbed2a406?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
String broccoliImg = "https://images.unsplash.com/photo-1518164147695-36c13dd568f5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String nutImg ="https://images.unsplash.com/photo-1594900689460-fdad3599342c?ixid=MXwxMjA3fDB8MHxzZWFyY2h8N3x8cGVhbnV0fGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
String saladImg = "https://images.unsplash.com/photo-1572449043416-55f4685c9bb7?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String saladImg2= "https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80";
String saladImg3 = "https://images.unsplash.com/photo-1592417817098-8fd3d9eb14a5?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80";
String saladImg4 = "https://images.unsplash.com/photo-1553455860-2fa544e14141?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTZ8fHNhbGFkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60";
List<String> lorem = ["It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
  "Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text"] ;

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

Nutrition nutrition1 = Nutrition(calories: Measure(unit:"gr", mag: 20), carbs: Measure(unit:"gr", mag: 20), proteins: Measure(unit:"gr", mag: 20), fats: Measure(unit:"gr", mag: 20));
Nutrition nutrition2 = Nutrition(calories: Measure(unit:"gr", mag: 20), carbs: Measure(unit:"gr", mag: 20), proteins: Measure(unit:"gr", mag: 20), fats: Measure(unit:"gr", mag: 20));
Nutrition nutrition3 = Nutrition(calories: Measure(unit:"gr", mag: 20), carbs: Measure(unit:"gr", mag: 20), proteins: Measure(unit:"gr", mag: 20), fats: Measure(unit:"gr", mag: 20));


class RecipeChoicesPage extends StatefulWidget {

  final void Function(List<Recipe>) onRecipesSelected;

  const RecipeChoicesPage({Key key, this.onRecipesSelected}) : super(key: key);

  @override
  _RecipeChoicesPageState createState() => _RecipeChoicesPageState();
}

class _RecipeChoicesPageState extends State<RecipeChoicesPage> {


  List<Recipe> availableRecipeChoices = [
//    Recipe(name: 'Tomato Salad', difficulty: 'EASY', prepTime: 20, cookTime: 5,
//        imgUrl: saladImg, instructions: lorem, nutrition: nutrition1, estimatedPrice: 80, ingredients: likedIngs ),
//    Recipe(name: 'Onion Salad', difficulty: 'HARD', prepTime: 30, cookTime: 2,
//        imgUrl: saladImg2, instructions: lorem, nutrition: nutrition2, estimatedPrice: 25, ingredients: likedIngs ),
//    Recipe(name: 'Brocolli Salad', difficulty: 'MEDIUM', prepTime: 5, cookTime: 5,
//        imgUrl: saladImg3, instructions: lorem, nutrition: nutrition1, estimatedPrice: 12, ingredients: dislikedIngs ),
//    Recipe(name: 'Potato Salad', difficulty: 'EASY', prepTime: 15, cookTime: 5,
//        imgUrl: saladImg4, instructions: lorem, nutrition: nutrition2, estimatedPrice: 36, ingredients: dislikedIngs ),
//    Recipe(name: 'Onion Salad', difficulty: 'HARD', prepTime: 30, cookTime: 2,
//        imgUrl: saladImg2, instructions: lorem, nutrition: nutrition2, estimatedPrice: 25, ingredients: likedIngs ),
//    Recipe(name: 'Brocolli Salad', difficulty: 'MEDIUM', prepTime: 5, cookTime: 5,
//        imgUrl: saladImg3, instructions: lorem, nutrition: nutrition1, estimatedPrice: 12, ingredients: dislikedIngs ),
  ];

  List<Recipe> checkedRecipes = [];


  @override
  void initState() {
    // TODO: implement initState
    fetchRecipes();
  }

  void fetchRecipes ({int n =30}) async {
    List<Recipe> tempRecipeChoices = await HttpCaller.fetchTopRecipesList(n);
    setState(() {
      availableRecipeChoices = tempRecipeChoices;
    });

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:  buildContent(),
      );
  }

  Column buildContent() {
    return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CHOOSE YOUR FAVOURITES!",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300,    ),
              )
            ],
          ),
          availableRecipeChoices.isEmpty ? Loader(): Container(),
          ...buildRecipeCards(availableRecipeChoices),
          BigButton(
              text: "Save",
              onClick: () {handleSave();},
          )
        ],

      );
  }



  List<Widget> buildRecipeCards(List<Recipe> recipes) {
    List<Widget> cards = [];
    for(int i = 0; i < recipes.length-1; i = i+2){
      cards.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children:[
                RecipeCard(recipe: availableRecipeChoices[i], onCardSelected: updateCheckedRecipes,),
                SizedBox(width: 12,),
                RecipeCard(recipe: availableRecipeChoices[i+1],onCardSelected: updateCheckedRecipes,)
              ],
            ),
          )
      );
    }
    return cards;
  }

  void handleSave(){

    widget.onRecipesSelected(checkedRecipes);

  }

  void updateCheckedRecipes(Recipe recipe, bool add){
    //print("recipeListUpdated");

    setState(() {
      add ? checkedRecipes.add(recipe) : checkedRecipes.remove(recipe) ;
    }) ;
    //print(checkedRecipes);
  }

}

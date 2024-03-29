import 'package:flutter/material.dart';
import 'package:foodster/Model/Meal.dart';
import 'package:foodster/controllers/http_caller.dart';
import 'package:foodster/controllers/ui_utils.dart';
import 'package:foodster/pages/recipe_details_page.dart';

class MealCard extends StatefulWidget {
  const MealCard({Key key, this.meal, this.hasHeader = true, this.canLikeMeals = true}) : super(key: key);
  final Meal meal;
  final bool hasHeader;
  final bool canLikeMeals;

  @override
  _MealCardState createState() => _MealCardState();
}

class _MealCardState extends State<MealCard> {
  final String backupImageAddress =
      "https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";

  List<String> likedRecipes = [];

  void likeRecipe(String recipeName) async {
    String result = await HttpCaller.likeRecipe(recipeName, contextForTokenExpirationHandling: context);
    print(result);
    setState(() {
      likedRecipes.add(recipeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              widget.hasHeader ? buildHeader() : Container(),
              buildRecipeList()
            ],
          ),
        ),
      ),
    );
  }

  Column buildHeader() {
    return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    widget.meal.name,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
//              Padding(
//                padding: const EdgeInsets.all(4),
//                child: Text("Calories: ${meal.calories}", style: TextStyle(fontSize: 14, color: Colors.grey[300])),
//              ),
                Divider(
                  color: Colors.grey,
                ),
              ],
            );
  }

  Column buildRecipeList() {
    return Column(
      children: widget.meal.servings
          .map((serving) => InkWell(
                onTap: () {
                  //navigate to recipe details
                  //Navigator.of(context).push()  RecipeDetailsPage(serving.recipe) );
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          RecipeDetailsPage(recipe: serving.recipe)));
                  //Navigator.of(context).pushNamed('/recipeDetails', arguments: serving.recipe);
                },
                child: Row(children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(26.0),
                    child: Image.network(
                      //meal.imgUrl
                      serving.recipe.imgUrl, //replace this with recipe image
                      height: 48,
                      width: 48,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 4),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Row(
                            children: [
                              Flexible(
                                flex: 3,
                                child: Text(
                                  serving.recipe.name.trim(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Flexible(
                                flex: 1,
                                child: widget.canLikeMeals ? IconButton(
                                    icon: Icon(
                                      Icons.thumb_up,
                                      color:
                                          likedRecipes.contains(serving.recipe.name)
                                              ? Colors.greenAccent
                                              : Colors.grey,
                                    ),
                                    onPressed: () async {
                                      likeRecipe(serving.recipe.name);
                                    }):
                                Container(),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Row(
                            children: [
                              Flexible(
                                flex: 1,
                                child: Text(
                                  "${UiUtils.firstLetterUppercase(serving.recipe.nutrition.calories.unit)}:  ${(serving.recipe.nutrition.calories.mag)} "
                                      .trim(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            SizedBox(
                              width: 20,
                            ),
                              Flexible(
                                flex: 1,
                                child: Text(
                                  "Cook Time: ${(serving.recipe.cookTime)} min"
                                      .trim(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            SizedBox(
                              width: 20,
                            ),
                              (serving.recipe.estimatedPrice) != null
                                  ? Flexible(
                                flex: 1,
                                child: Text(
                                   "Price : ${(serving.recipe.estimatedPrice)} TL"
                                          .trim(),
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300),
                                ),
                              ): Container(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ]),
              ))
          .toList(),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodster/Model/Recipe.dart';
import 'package:foodster/components/busy_spinkit.dart';
import 'package:foodster/controllers/http_caller.dart';
import 'package:foodster/controllers/logout.dart';
import 'package:foodster/controllers/ui_utils.dart';

class RecipeDetailsPage extends StatefulWidget {
  final Recipe recipe;

  const RecipeDetailsPage({Key key, this.recipe}) : super(key: key);

  @override
  _RecipeDetailsPageState createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  List<bool> openExpansionPanels = [];
  Recipe recipe;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.recipe.ingredients.forEach((element) {
      openExpansionPanels.add(false);
    });
    fetchRecipeDetails();
  }

  void fetchRecipeDetails() async {
    print("fetching recipe details");
    print(widget.recipe.name);
    Recipe tempRecipe = await HttpCaller.fetchRecipe(widget.recipe.name);
    setState(() {
      recipe = tempRecipe;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: !(isLoading)
            ? Column(
                children: [
                  buildStack(recipe, context),
                  buildIngredients(),
                ],
              )
            : Center(
                child: Loader(),
              ),
      ),
    );
  }

  buildIngredients() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildHeading(title: "Ingredients"),
            Divider(),
            buildIngredientsPanel(),
            buildHeading(title: "Instructions"),
            Divider(),
            buildInstructions()
          ],
        ),
      ),
    );
  }

  Widget buildIngredientsPanel() {
    List<ExpansionPanel> panels = [];
    int panelIndex = 0;
    recipe.ingredients.forEach((ingredient) {
      panels.add(ExpansionPanel(
        headerBuilder: (context, isOpen) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    "${UiUtils.firstLetterUppercase(ingredient.ingBase.name)}"),
                Text(
                    "${ingredient.measure.mag} ${UiUtils.firstLetterUppercase(ingredient.measure.unit)}")
              ],
            ),
          );
        },
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ingredient.description),
        ),
        isExpanded: openExpansionPanels[panelIndex],
      ));
      panelIndex++;
    });
    return ExpansionPanelList(
      expansionCallback: (i, isOpen) {
        setState(() {
          openExpansionPanels[i] = !isOpen;
        });
      },
      children: panels,
    );
  }

  Widget buildInstructions() {
    return Column(
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Cook Time: ${recipe.cookTime} minutes", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.75),),
              Text("Prep Time: ${recipe.prepTime} minutes", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16, letterSpacing: 0.75),)
            ]
        ),

        new Container(
          padding: const EdgeInsets.all(16.0),
          child: new Column(
              children:
                  recipe.instructions.map((instruction) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(instruction, textAlign: TextAlign.left,style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),),
                  )).toList()),
        ),

      ],
    );
  }

  Padding buildHeading({String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text('Foodster'),
      centerTitle: true,
      backgroundColor: Colors.greenAccent,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () => {logout(context)}, //logout here
              child: Icon(
                Icons.exit_to_app,
                size: 26.0,
              ),
            )),
      ],
    );
  }

  Widget buildStack(Recipe recipe, BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 256,
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(48)),
          child: Image.network(
            recipe.imgUrl,
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(1.0),
            colorBlendMode: BlendMode.softLight,
          ),
        ),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: 256,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(48)),
            gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                begin: FractionalOffset(0, 0),
                end: FractionalOffset(0, 1),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp)),
        child: buildHeading(title: widget.recipe.name),
      ),
    ]);
  }
}

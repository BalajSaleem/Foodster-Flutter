import 'package:flutter/material.dart';
import 'package:foodster/Model/Recipe.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  final void Function(Recipe, bool) onCardSelected;

  const RecipeCard({Key key, this.recipe, this.onCardSelected}) : super(key: key);

  @override
  _RecipeCardState createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {

  bool isChecked = false;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Stack(
          children: [
            Container(
              width: 256,
              height: 256,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(48),
                child: Image.network(
                  widget.recipe.imgUrl,
                  fit: BoxFit.cover,
                  color: Colors.black.withOpacity(1.0),
                  colorBlendMode: BlendMode.softLight,

                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
                widget.onCardSelected(widget.recipe, isChecked);
              },
              child: Container(
                width: 256,
                height: 256,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(48),
                    gradient: LinearGradient(
                        colors: isChecked ? [Colors.transparent, Colors.green.withOpacity(0.8)]
                            : [Colors.transparent, Colors.black.withOpacity(0.8)],
                        begin: FractionalOffset(0, 0),
                        end: FractionalOffset(0, 1),
                        stops: [0.0, 1.0],
                        tileMode: TileMode.clamp
                    )
                ),
                child: buildCardBottom(),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: isChecked ? Icon(Icons.check, size: 64, color: Colors.greenAccent,) : Container(),
            )
          ]
        ),
      ),
    );
  }

  Padding buildCardBottom() {
    return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Name: ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200,  ),),
                      Text(widget.recipe.name, style: TextStyle(fontWeight: FontWeight.w300,  )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Difficulty: ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200,  ),),
                      Text(widget.recipe.difficulty, style: TextStyle(fontWeight: FontWeight.w300,  )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Ingredients: ", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w200,  ),),
                      Expanded(
                        child: Text(
                          (widget.recipe.ingredients.map((e) => e.name).toList().join(' , ')),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.w300,  )
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            );
  }
}

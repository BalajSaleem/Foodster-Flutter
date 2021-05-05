import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodster/Model/Preferences.dart';
import 'package:foodster/Model/User.dart';
import 'package:foodster/components/big_button.dart';
import 'package:foodster/components/busy_spinkit.dart';
import 'package:foodster/controllers/http_caller.dart';

//TODO: MAKE THIS STATEFUL FOR TEXT EDITING CONTROLLERS
class PreferencesCard extends StatefulWidget {
  const PreferencesCard(
      {Key key, this.preferences, this.hasUpdateButton = true, this.onClick=null, this.buttonText = "Update"})
      : super(key: key);
  final Preferences preferences;
  final bool hasUpdateButton;
  final void Function(Preferences) onClick;
  final String buttonText;

  @override
  _PreferencesCardState createState() => _PreferencesCardState();
}

class _PreferencesCardState extends State<PreferencesCard> {
  TextEditingController costFromController = new TextEditingController();
  TextEditingController costToController = new TextEditingController();
  TextEditingController carbFromController = new TextEditingController();
  TextEditingController carbToController = new TextEditingController();
  TextEditingController protFromController = new TextEditingController();
  TextEditingController protToController = new TextEditingController();
  TextEditingController calFromController = new TextEditingController();
  TextEditingController calToController = new TextEditingController();
  TextEditingController fatFromController = new TextEditingController();
  TextEditingController fatToController = new TextEditingController();
  static const diets = ["vegan", "paleo", "keto", "vegetarian"];
  String selectedDiet = diets[0];
  bool isUpdateLoading = false;
  Preferences preferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      preferences = widget.preferences;
      selectedDiet = widget.preferences.dietType;
    });
  }

  void updateUser() async {
    print("Updating user");
    Preferences prefs = parseAll();
    dynamic json = prefs.toUserJson();
    setState(() {
      isUpdateLoading = true;
    });
    User updatedUser = await HttpCaller.updateUser(json, contextForTokenExpirationHandling: context);
    setState(() {
      isUpdateLoading = false;
      preferences = updatedUser.preferences;
    });
  }

  Preferences parseAll(){
    return Preferences(calRange: [
      int.parse(calFromController.text),
      int.parse(calToController.text)
    ], fatRange: [
      int.parse(fatFromController.text),
      int.parse(fatToController.text)
    ], carbRange: [
      int.parse(carbFromController.text),
      int.parse(carbToController.text)
    ], protRange: [
      int.parse(protFromController.text),
      int.parse(protToController.text)
    ], costRange: [
      int.parse(costFromController.text),
      int.parse(costToController.text)
    ], dietType: selectedDiet);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: buildPreferences(),
        ),
      ),
    );
  }

  Column buildPreferences() {
    return Column(children: [
      buildPreference("Cost Range", "TL", preferences.costRange[0],
          preferences.costRange[1], costFromController, costToController),
      buildPreference("Calorie Range", "KCal", preferences.calRange[0],
          preferences.calRange[1], calFromController, calToController),
      buildPreference("Fat Range", "gr", preferences.fatRange[0],
          preferences.fatRange[1], fatFromController, fatToController),
      buildPreference("Carbohydrate Range", "gr", preferences.carbRange[0],
          preferences.carbRange[1], carbFromController, carbToController),
      buildPreference("Protein Range", "gr", preferences.protRange[0],
          preferences.protRange[1], protFromController, protToController),
      SizedBox(
        height: 24,
      ),
      buildDietTypeDropDown(),
      SizedBox(
        height: 8,
      ),
      widget.hasUpdateButton
          ? !isUpdateLoading
              ? BigButton(
                  text: "${widget.buttonText}",
                  onClick: widget.onClick == null ? updateUser : () { Preferences prefs = parseAll();  widget.onClick(prefs); },
                )
              : Loader()
          : Container()
    ]);
  }

  Row buildDietTypeDropDown() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Diet Type",
          style: TextStyle(
              color: Colors.grey[400],
              fontSize: 16,
              fontWeight: FontWeight.w300),
        ),
        DropdownButton(
            hint: Text("Gender"),
            value: selectedDiet,
            onChanged: (value) {
              setState(() {
                selectedDiet = value;
              });
            },
            items: diets
                .map<DropdownMenuItem<String>>(
                    (String e) => DropdownMenuItem<String>(
                          value: e,
                          child: Text(e),
                        ))
                .toList()),
      ],
    );
  }

  Row buildPreference(
      String fieldName,
      String unit,
      int from,
      int to,
      TextEditingController fromController,
      TextEditingController toController) {
    fromController.value = TextEditingValue(text: "$from");
    toController.value = TextEditingValue(text: "$to");
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
            flex: 5,
            child: Text(
              fieldName,
              style: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            )),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: fromController,
            //initialValue: "$from",
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'From ($unit)',
                labelStyle: TextStyle(fontSize: 14),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
          ),
        ),
        SizedBox(
          width: 24,
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            controller: toController,
            //initialValue: "$to",
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: 'To ($unit)',
                labelStyle: TextStyle(fontSize: 14),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.green))),
          ),
        ),
      ],
    );
  }
}

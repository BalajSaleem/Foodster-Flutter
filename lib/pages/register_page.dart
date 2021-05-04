import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodster/Model/Preferences.dart';
import 'package:foodster/Model/User.dart';
import 'package:foodster/components/busy_spinkit.dart';
import 'package:foodster/components/preferences_card.dart';
import 'package:foodster/controllers/pref_manager.dart';
import 'package:foodster/components/big_button.dart';

import '../controllers/ui_utils.dart';

import 'package:foodster/controllers/http_caller.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static const genders = ["Male", "Female", "Apache Helicopter"];
  bool isOfficer = false;
  String selectedGender = genders[0];
  int numberOfMeals = 2;
  int mealPlanDuration = 2;
  Preferences prefs = Preferences(
    calRange: [1000, 2000],
    fatRange: [20,30],
    carbRange: [100,200],
    protRange: [100,120],
    costRange: [100,200],
    dietType: 'keto',
  );
  static const allergies = ["milk", "egg", "peanuts", "cashews","wheat", "soy", "fish", "nuts"];

  List<String> selectedAllergies = [];

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _surnameController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _weightController = new TextEditingController();
  TextEditingController _heightController = new TextEditingController();
  bool isLoading = false;

  void handleRegister(Preferences prefs){
    prefs.mealsPerDay = numberOfMeals;
    prefs.mealPlanDuration = mealPlanDuration;
    String email = _emailController.text;
    String password = _passwordController.text;
    String name = _nameController.text;
    String surname = _surnameController.text;
    String age = _ageController.text;
    String weight = _weightController.text;
    String height = _heightController.text;

    if(email == '' || password == '' || name == '' || surname == '' || age == '' || weight == '' || height == ''){
      UiUtils.showToast('Please check if all text fields are filled');
      return;
    }

    User user = new User(
      email: email,
      password: password,
      name: name,
      gender: selectedGender,
      surname: surname,
      age: int.parse(age),
      weight: int.parse(weight),
      height: int.parse(height),
      allergies: selectedAllergies,
      preferences: prefs
    );
    dynamic json = user.toJson();
    print(json);
    setState(() {
      isLoading = true;
    });
    HttpCaller.signup(json,
            (bool success, int statusCode){
          if(success) {
            setState(() {
              isLoading = false;
            });
            print('Logging in');
            Navigator.of(context).popAndPushNamed('/login');
          }
          else{
            UiUtils.showToast('Failed to Sign Up');
          }
        });

  }

  void _handleRegister(BuildContext context){
    String email = _emailController.text;
    String password = _passwordController.text;

    if(email == '' || password == ''){
      UiUtils.showToast('Email and Password cannot be left empty.');
      return;
    }


  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // TODO check if the following change messes anything
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 40.0, 0.0, 0.0),
                  child: Center(
                    child: Text('Welcome to Foodster', style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                  ),
                )),
                Container(
                    padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: _nameController,
                                decoration: InputDecoration(
                                    labelText: 'NAME',
                                    labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _surnameController,
                                decoration: InputDecoration(
                                    labelText: 'SURNAME',
                                    labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                              ),
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                        ),
                        SizedBox(height: 20.0),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: TextField(
                                controller: _heightController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'HEIGHT (cm)',
                                    labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _weightController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'WEIGHT (Kg)',
                                    labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _ageController,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    labelText: 'AGE',
                                    labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                              ),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        ),
                        SizedBox(height: 24.0),
                        Column(
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                  color: Colors.grey[400]
                              ),
                            ),
                            DropdownButton(
                                hint: Text("Gender"),
                                value: selectedGender,
                                onChanged: (value) {
                                  setState(() {
                                    selectedGender = value;
                                  });
                                },
                                items: genders
                                    .map<DropdownMenuItem<String>>((String e) => DropdownMenuItem<String>(
                                  value: e,
                                  child: Text(e),
                                ))
                                    .toList()
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Text(
                          "Allergies",
                          style: TextStyle(
                              color: Colors.grey[400]
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Row(children: <Widget>[
                          ...allergies.map((allergy) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Text("$allergy", style: TextStyle(fontSize: 12, color: Colors.grey[500]),),
                              ),
                              Checkbox(
                                value: selectedAllergies.contains(allergy),
                                onChanged: (value) {
                                  setState(() {
                                    value ? selectedAllergies.add(allergy): selectedAllergies.remove(allergy) ;
                                  });
                                },
                              ),
                            ],
                          )).toList()
                        ]),
                        SizedBox(height: 20.0),
                        Column(
                          children: [
                            Text(
                              "Meals Per Day",
                              style: TextStyle(
                                  color: Colors.grey[400]
                              ),
                            ),
                            //SizedBox(height: 16,),
                            Slider(
                              value:  numberOfMeals.toDouble(),
                              divisions: 6,
                              onChanged: (val) { setState(() {
                                numberOfMeals = val.toInt();
                              }); },
                              min: 1,
                              max: 6,
                              label: "$numberOfMeals meals",
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Meal Plan Duration",
                              style: TextStyle(
                                  color: Colors.grey[400]
                              ),
                            ),
                            //SizedBox(height: 16,),
                            Slider(
                              value:  mealPlanDuration.toDouble(),
                              divisions: 7,
                              onChanged: (val) { setState(() {
                                mealPlanDuration = val.toInt();
                              }); },
                              min: 1,
                              max: 7,
                              label: "$mealPlanDuration days",
                            ),
                          ],
                        ),
                        PreferencesCard(preferences: prefs, onClick: handleRegister, buttonText: "Register",),
//                        Container(
//                          height: 40.0,
//                          child: BigButton(text: "Register", onClick: () => _handleRegister(context))
//                        ),
                        isLoading ? Loader() : SizedBox(height: 20.0),
                      ],
                    )),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already Have an account?',
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

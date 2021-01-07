import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodster/pref_manager.dart';
import 'package:foodster/components/big_button.dart';

import 'ui_utils.dart';

import 'package:foodster/RestCalls/http_caller.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static const genders = ["Male", "Female", "Apache Helicopter"];
  bool isOfficer = false;
  String selectedGender = genders[0];

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  void _handleRegister(BuildContext context){
    String email = _emailController.text;
    String password = _passwordController.text;

    if(email == '' || password == ''){
      UiUtils.showToast('Email and Password cannot be left empty.');
      return;
    }

    HttpCaller.signup(email, password,
            (bool success, int statusCode, [String token = '']){
              if(success) {
                print('Logging in');
                PrefManager.storeToken(token);
                Navigator.of(context).popAndPushNamed('/home');
              }
              else{
                UiUtils.showToast('Failed to Sign Up');
              }
            });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          // Row(children: <Widget>[
                          //   Text(
                          //     'Officer',
                          //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                          //   ),
                          //   Checkbox(
                          //     value: isOfficer,
                          //     onChanged: (value) {
                          //       setState(() {
                          //         isOfficer = value;
                          //       });
                          //     },
                          //   ),
                          // ]),
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
                      SizedBox(height: 20.0),
                      Container(
                        height: 40.0,
                        child: BigButton("Register", () => _handleRegister(context))
                      ),
                      SizedBox(height: 20.0),
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
        ));
  }
}

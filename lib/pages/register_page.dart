import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodster/components/big_button.dart';

//import 'package:exodus/models/Person.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  static const genders = ["Male", "Female", "Apache Helicopter"];
  bool isOfficer = false;
  String selectedGender = genders[0];

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
                        decoration: InputDecoration(
                            labelText: 'EMAIL',
                            labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20.0),
                      TextField(
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
                        child: BigButton("Register", (){})
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

//import 'package:exodus/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodster/controllers/http_caller.dart';
import 'package:foodster/components/big_button.dart';
import 'package:foodster/controllers/ui_utils.dart';
import 'package:foodster/controllers/pref_manager.dart';

//import 'package:exodus/models/Person.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool isLoading = false;

  void handleLogin(BuildContext context) {
    print('handling login');
    //Navigator.of(context).pushNamed('/home');
    String email = _emailController.text;
    String password = _passwordController.text;

    if(email == '' || password == ''){
     UiUtils.showToast('Email and Password cannot be left empty.');
     return;
    }
    HttpCaller.login(email, password, (bool success, int statusCode, [String token = '']) {
      if(success){
        print('Logging in');
        PrefManager.storeToken(token);
        Navigator.of(context).popAndPushNamed('/home');
      }
      else{
        UiUtils.showToast('Failed to Log In');
      }
    });
  }

  // void _showToast(BuildContext context, String message) {
  //   final scaffold = Scaffold.of(context);
  //   scaffold.showSnackBar(
  //     SnackBar(
  //       content: Text(message),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: Container(
                  padding: EdgeInsets.fromLTRB(15.0, 40.0, 0.0, 0.0),
                  child: Text('Welcome to Foodster', style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold)),
                )),
                Container(
                    padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: _emailController,
                          autofillHints: [AutofillHints.username],
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                        ),
                        SizedBox(height: 20.0),
                        TextField(
                          controller: _passwordController,
                          autofillHints: [AutofillHints.password],
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.green))),
                          obscureText: true,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        SizedBox(height: 40.0),
                        Container(
                            height: 40.0,
                            child: !isLoading
                                ? BigButton(text: "Login", onClick: () {handleLogin(context);})
                                : SpinKitWave(
                                    color: Colors.greenAccent,
                                    size: 30,
                                  )),
                        SizedBox(height: 20.0),
                      ],
                    )),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'New to Foodster?',
                    ),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/register');
                      },
                      child: Text(
                        'Register',
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

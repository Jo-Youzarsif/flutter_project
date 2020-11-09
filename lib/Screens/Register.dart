import 'package:flutter/material.dart';
import 'package:flutter_project/models/alert_dialog.dart';
import 'package:flutter_project/models/loading_icon.dart';
//import 'package:flutter_project/Database/Task.dart';
//import 'package:flutter_project/models/alert_dialog.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert';
import '../services/auth.dart';

class RegisterNewUser extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<RegisterNewUser> {
  //--
  _checkRegisterUserInfo() async {
    isLoading = true;
    if (_formKey.currentState.validate()) {
      print("Trying to register with Email: ${textEmail.text} Password: ${textPassword.text}");
      dynamic result = await _auth.registerUserEmailAndPassword(textEmail.text, textPassword.text);
      if (result == null) {
        isLoading = false;
        showCustomDialog("error", context);
      }
      Navigator.of(context).pop();
    }
  }

  //--
  final _formKey = GlobalKey<FormState>();
  //--
  final TextEditingController textEmail = TextEditingController();
  final TextEditingController textPassword = TextEditingController();
  final AuthService _auth = AuthService();
  //--
  bool isPasswordHidden = true;
  bool isLoading = false;
  Icon passwordToggle = Icon(Icons.visibility);
  //--
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 30.0, horizontal: 0),
                      child: Image.asset(
                        "Assets/Images/logo.png",
                        width: 350.0,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Register page",
                      style: TextStyle(
                        fontFamily: ("Grenze-Light"),
                        fontSize: 50.0,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 40.0,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                            child: TextFormField(
                              validator: (val) {
                                if (val.isEmpty) {
                                  //showCustomDialog("empty", context)
                                  return "Please enter your Email.";
                                } else {
                                  return null;
                                }
                              },
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: ("Grenze-Light"),
                              ),
                              controller: textEmail,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_box),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 5,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                labelText: 'Email',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 0, horizontal: 20.0),
                            child: TextFormField(
                              validator: (val) {
                                if (val.isEmpty) {
                                  //showCustomDialog("empty", context)
                                  return "Password can not be empty.";
                                } else if (val.length < 6) {
                                  return "Password must be at least 6 characters long!";
                                } else {
                                  return null;
                                }
                              },
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontFamily: ("Grenze-Light"),
                              ),
                              controller: textPassword,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isPasswordHidden = !isPasswordHidden;
                                      if (isPasswordHidden) {
                                        passwordToggle = Icon(Icons.visibility_off);
                                      } else {
                                        passwordToggle = Icon(Icons.visibility);
                                      }
                                    });
                                  },
                                  icon: passwordToggle,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    width: 5,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                labelText: 'Password',
                              ),
                              obscureText: isPasswordHidden,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    RaisedButton(
                      // ---------------------------------- Register Button ----------------------------------
                      onPressed: () {
                        //Navigator.of(context).pushNamed("Register");
                        //_showNewUserMenu(context);
                        //_showDialog();
                        _checkRegisterUserInfo();
                      },
                      color: Colors.black45,
                      elevation: 7.0,
                      //focusElevation: 10.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: Colors.white24,
                          width: 5,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 80.0,
                      ),
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontFamily: ("Grenze-Light"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                  ],
                ),
                isLoading ? LoadingIcon() : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

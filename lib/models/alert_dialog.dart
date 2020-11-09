import 'package:flutter/material.dart';

void showCustomDialog(String index, BuildContext context) {
  switch (index) {
    case "SearchError":
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Search!"),
            content: Text("Please search for a card you want to add first."),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      break;
    case "error":
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Email is not correct"),
            content: Text("Please check your Email, and try again."),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      break;
    case "wrong Password":
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Password is not correct"),
            content: Text("Check you password, and try again."),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {},
              ),
            ],
          );
        },
      );
      break;
    case "new":
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Username not found"),
            content: Text("Username you input not found, do you want to register new?"),
            actions: <Widget>[
              FlatButton(
                child: Text("Register New"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("Register");
                },
              ),
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      break;
    case "loading":
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Loading, please wait."),
          );
        },
      );
      break;
    case "exist":
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return AlertDialog(
            title: Text("Username Taken"),
            content: Text("Username you picked is already taken, please try another Username"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      break;
    case "empty":
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Missing Info"),
            content: Text("Username or password missing, please fill all text fields"),
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      break;
    case "finished":
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Register complete"),
            content: Text("Your Username and password has been saved, continue to home."),
            actions: <Widget>[
              FlatButton(
                child: Text("Next"),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed("Home");
                },
              ),
            ],
          );
        },
      );
      break;
  }
}

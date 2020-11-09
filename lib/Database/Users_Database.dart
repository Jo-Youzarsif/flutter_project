import 'package:flutter/material.dart';

class AppUser with ChangeNotifier {
  final String uid;
  AppUser({this.uid});
}

class UsersSnapShot {
  String name;
  String rank;
  String username;
  String league;
  int cardsNumber;

  UsersSnapShot({this.name, this.rank, this.username, this.league, this.cardsNumber});
}

class UserData {
  String uid;
  String name;
  String rank;
  String username;
  String league;
  int cardsNumber;

  UserData({this.uid, this.name, this.rank, this.username, this.league, this.cardsNumber});
}

class UserCardsList {
  // List<String> cardsList = new List<String>();
  List<dynamic> cardsList = new List<dynamic>();
  UserCardsList({this.cardsList});
}

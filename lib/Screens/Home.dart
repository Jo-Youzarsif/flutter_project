import 'package:flutter/material.dart';
//import 'package:flutter_project/Screens/BNB_cards_deck_.dart';
//import 'BNB_cards_deck.dart';
import 'package:flutter_project/Screens/BNB_home.dart';
import 'package:flutter_project/Screens/BNB_profile.dart';
import 'package:flutter_project/Screens/BNB_search.dart';
//import 'package:flutter_project/models/CardsDeck.dart';
import 'package:flutter_project/Screens/temp_deck_cards.dart';
import 'package:flutter_project/services/auth.dart';
import 'package:provider/provider.dart';
import '../models/CardsDeck.dart';
//import '../Database/Card.dart';

class NavObject {
  Widget screen;
  Icon navIcon;
  Text title;

  NavObject({this.screen, this.navIcon, this.title});
}

String appBarText = "Home Page";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Magic the gathering",
            style: TextStyle(
              fontFamily: ("Grenze-Light"),
              fontSize: 23.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
              child: FlatButton(
                onPressed: () async {
                  await _auth.signUserOut();
                },
                color: Colors.blueAccent[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    fontFamily: ("Grenze-Light"),
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: HomePageApp(),
      ),
    );
  }
}

class HomePageApp extends StatefulWidget {
  @override
  _HomePageAppState createState() => _HomePageAppState();
}

class _HomePageAppState extends State<HomePageApp> {
  int _selectedIndex = 1;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (_selectedIndex) {
        case 0:
          appBarText = "Profile Page";
          print("Index: $_selectedIndex, Profile Page");
          break;
        case 1:
          appBarText = "Cards Page";
          print("Index: $_selectedIndex, Cards Page");
          break;
        case 2:
          appBarText = "Home Page";
          print("Index: $_selectedIndex, Home Page");
          break;
        case 3:
          appBarText = "Search Page";
          print("Index: $_selectedIndex, Search Page");
          break;
      }
    });
  }

  List<NavObject> _widgetOptions = <NavObject>[
    NavObject(screen: BNBProfileScreen(), navIcon: Icon(Icons.account_box), title: Text("Profile")),
    NavObject(screen: BNBHomeScreen(), navIcon: Icon(Icons.home), title: Text("home")),
    NavObject(screen: CardsDeckTemp(), navIcon: Icon(Icons.view_carousel), title: Text("Cards")),
    NavObject(screen: BNBSearchScreen(), navIcon: Icon(Icons.search), title: Text("Search")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => CardsDeck(),
        //child: Center(
        child: _widgetOptions.elementAt(_selectedIndex).screen,
        //),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _widgetOptions[0].navIcon,
            title: _widgetOptions[0].title,
          ),
          BottomNavigationBarItem(
            icon: _widgetOptions[1].navIcon,
            title: _widgetOptions[1].title,
          ),
          BottomNavigationBarItem(
            icon: _widgetOptions[2].navIcon,
            title: _widgetOptions[2].title,
          ),
          BottomNavigationBarItem(
            icon: _widgetOptions[3].navIcon,
            title: _widgetOptions[3].title,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

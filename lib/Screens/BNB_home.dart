import 'dart:convert';
import 'package:flutter_project/models/loading_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import '../Database/Card.dart';
import 'package:http/http.dart' as http;

class BNBHomeScreen extends StatefulWidget {
  @override
  _BNBHomeScreenState createState() => _BNBHomeScreenState();
}

class _BNBHomeScreenState extends State<BNBHomeScreen> {
  CardVM cardRandom;
  bool isLoading = true;

  Color colorPrimary = Colors.white54;
  Color colorSecondary = Colors.white24;
  Color colorFont = Colors.black;

  TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: ("Grenze-Light"),
    //color: colorPrimary,
  );

  @override
  void initState() {
    super.initState();
    getRandomCard();
  }

  void goToWebView() {
    if (!isLoading) {
      launch(cardRandom.linkToCard);
    }
  }

  void getRandomCard() async {
    var response = await http.get("https://api.scryfall.com/cards/random");
    //var response = await http.get("https://api.scryfall.com/cards/e5145f31-a4ac-44ef-8f85-e4d95f2c9ff5?format=json&pretty=true");
    cardRandom = CardVM.fromJson(json.decode(response.body));
    setState(() {
      isLoading = false;

      if (cardRandom.cardColors.isNotEmpty) {
        if (cardRandom.cardColors.length == 1) {
          switch (cardRandom.cardColors[0]) {
            case "W": // W -> white
              colorPrimary = Colors.orangeAccent.shade400;
              colorSecondary = Colors.orangeAccent.shade200;
              break;
            case "U": // U -> blue
              colorPrimary = Colors.blueAccent;
              colorSecondary = Colors.lightBlue;
              break;
            case "B": // B -> black
              colorPrimary = Colors.black45;
              colorSecondary = Colors.black12;
              colorFont = Colors.white;
              break;
            case "R": // R -> red
              colorPrimary = Colors.redAccent;
              colorSecondary = Colors.redAccent.shade100;
              break;
            case "G": // G -> green
              colorPrimary = Colors.green.shade800;
              colorSecondary = Colors.green.shade400;
              break;
          }
        } else if (cardRandom.cardColors.length > 1) {
          colorPrimary = Colors.black12;
          colorSecondary = Colors.white54;
          colorFont = Colors.black;
        }
      } else {
        colorPrimary = Colors.black12;
        colorSecondary = Colors.white54;
        colorFont = Colors.black;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    color: colorPrimary,
                    spreadRadius: 1,
                    blurRadius: 0,
                    offset: Offset(3, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Image.asset(
                "Assets/Images/logo.png",
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width / 1.2,
              ),
            ),
            isLoading // --------------------- Image _ Random Card ---------------------
                ? LoadingIcon()
                : Container(
                    margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                    //child: Image.network(cardRandom.imageUris["png"]),
                    child: Image.network(cardRandom.imageUris["large"]),
                  ),
            isLoading
                ? Container()
                : RaisedButton(
                    // --------------------- Button _ To card link (scryfall_uri) ---------------------
                    onPressed: () {
                      goToWebView();
                    },
                    color: colorSecondary,
                    padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: colorPrimary,
                        width: 5,
                      ),
                    ),
                    child: Text(
                      "Link to card",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: ("Grenze-Light"),
                        color: colorFont,
                      ),
                    ),
                  ),
            Container(
              //--------------------- Text _ Card Information ---------------------
              alignment: Alignment.center,
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: new BorderRadius.circular(6.0),
                color: colorPrimary,
              ),
              child: isLoading
                  ? Container()
                  : Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(15.0),
                            color: colorSecondary,
                          ),
                          child: Text(
                            "Card Information:",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: ("Grenze-Light"),
                              color: colorFont,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 1.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(15.0),
                            color: colorSecondary,
                          ),
                          child: cardRandom.typeLine == null
                              ? Text(
                                  "No Type Line to display",
                                  style: TextStyle(
                                    color: colorFont,
                                  ),
                                )
                              : Text(
                                  "Type line:\n ${cardRandom.typeLine}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ("Grenze-Light"),
                                    color: colorFont,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        SizedBox(
                          height: 1.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(15.0),
                            color: colorSecondary,
                          ),
                          child: cardRandom.oracleText == null || cardRandom.oracleText == ""
                              ? Text(
                                  "No Oracle text to display",
                                  style: TextStyle(
                                    color: colorFont,
                                  ),
                                )
                              : Text(
                                  "Oracle text:\n ${cardRandom.oracleText}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ("Grenze-Light"),
                                    color: colorFont,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        SizedBox(
                          height: 1.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(15.0),
                            color: colorSecondary,
                          ),
                          child: cardRandom.powerN == null
                              ? Text(
                                  "No Power / Toughness to display",
                                  style: TextStyle(
                                    color: colorFont,
                                  ),
                                )
                              : Text(
                                  "Power / Toughness \n ${cardRandom.powerN} / ${cardRandom.toughnessN}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ("Grenze-Light"),
                                    color: colorFont,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ],
                    ),
              // --------------------- END Card Information ---------------------
            ),
          ],
        ),
      ),
    );
  }
}

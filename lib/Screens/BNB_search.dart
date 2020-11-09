import 'package:flutter/material.dart';
import 'package:flutter_project/models/loading_icon.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Database/Card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:photo_view/photo_view.dart';

class BNBSearchScreen extends StatefulWidget {
  @override
  _BNBSearchScreenState createState() => _BNBSearchScreenState();
}

class _BNBSearchScreenState extends State<BNBSearchScreen> {
  TextEditingController searchName = TextEditingController();
  //TextEditingController searchSet = TextEditingController();
  //TextEditingController searchDate = TextEditingController();

  Color colorPrimary = Colors.white54;
  Color colorSecondary = Colors.white24;
  Color colorFont = Colors.black;

  CardVM cardNamed;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // ----------------------------- search method 1 --------------------------
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Column(
                  children: <Widget>[
                    // ------------------------------- Search by Name -------------------------------
                    Container(
                      // --- Search by name ---
                      height: 80.0,
                      margin: EdgeInsets.symmetric(vertical: 1, horizontal: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.black26,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 50.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 1,
                                  blurRadius: 0,
                                  offset: Offset(3, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: EdgeInsets.fromLTRB(10.0, 10.0, 2.5, 10.0),
                            child: Center(
                              child: Text(
                                "by Name: ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: ("Grenze-Light"),
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50.0,
                            width: 245.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: 1,
                                  blurRadius: 0,
                                  offset: Offset(3, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            margin: EdgeInsets.fromLTRB(10.0, 10.0, 2.5, 10.0),
                            child: Center(
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23.0,
                                  fontFamily: ("Grenze-Light"),
                                ),
                                controller: searchName,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 5,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  labelText: 'Card Name',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 7.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SizedBox(
                          width: 10.0,
                        ),
                        Container(
                          // --- Search Button ---
                          height: 50.0,
                          width: 200.0,
                          margin: EdgeInsets.symmetric(vertical: 1, horizontal: 2.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: 1,
                                blurRadius: 0,
                                offset: Offset(3, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: RaisedButton(
                            onPressed: () {
                              searchCardsByName(searchName.text);
                            },
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "Search",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: ("Grenze-Light"),
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                  ],
                ),
              ),
              // ----------------------------- search method 2 --------------------------
              SizedBox(
                height: 10.0,
              ),
              Container(
                //padding: EdgeInsets.all(5.0),
                //margin: EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: isLoading ? LoadingIcon() : returnResult(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool canCallReturnResult = false;
  bool isSearchReturnedCard = false;
  bool isLoading = false;

  Widget returnResult() {
    if (canCallReturnResult) {
      if (isSearchReturnedCard) {
        return Container(
          padding: EdgeInsets.all(10.0),
          //margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: <Widget>[
              ClipRect(
                child: Container(
                  //margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: PhotoView(
                    imageProvider: NetworkImage(cardNamed.imageUris["png"]),
                    minScale: PhotoViewComputedScale.contained,
                    maxScale: PhotoViewComputedScale.contained * 2,
                    backgroundDecoration: BoxDecoration(),
                  ),
                  //child: Image.network(cardRandom.imageUris["large"]),
                ),
              ),
              SizedBox(height: 10.0),
              Container(
                // --- Search Button ---
                height: 50.0,
                width: 200.0,
                margin: EdgeInsets.symmetric(vertical: 1, horizontal: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      spreadRadius: 1,
                      blurRadius: 0,
                      offset: Offset(3, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: RaisedButton(
                  onPressed: () {
                    launch(cardNamed.linkToCard);
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    "Link ot card",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ("Grenze-Light"),
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              cardInfo(context),
            ],
          ),
        );
      } else {
        return Container(
          child: Text("Card not found"),
        );
      }
    } else {
      return Container();
    }
  }

  Widget cardInfo(BuildContext context) {
    return Column(
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
          child: cardNamed.typeLine == null
              ? Text(
                  "No Type Line to display",
                  style: TextStyle(
                    color: colorFont,
                  ),
                )
              : Text(
                  "Type line:\n ${cardNamed.typeLine}",
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
          child: cardNamed.oracleText == null || cardNamed.oracleText == ""
              ? Text(
                  "No Oracle text to display",
                  style: TextStyle(
                    color: colorFont,
                  ),
                )
              : Text(
                  "Oracle text:\n ${cardNamed.oracleText}",
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
          child: cardNamed.powerN == null
              ? Text(
                  "No Power / Toughness to display",
                  style: TextStyle(
                    color: colorFont,
                  ),
                )
              : Text(
                  "Power / Toughness \n ${cardNamed.powerN} / ${cardNamed.toughnessN}",
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
    );
  }

  void searchCardsByName(String name) async {
    //https://api.scryfall.com/cards/named?fuzzy=
    setState(() {
      isLoading = true;
    });
    canCallReturnResult = true;
    String newName = name.trimRight();
    newName = newName.replaceAll(" ", "+");

    var response = await http.get("https://api.scryfall.com/cards/named?fuzzy=$newName");
    cardNamed = CardVM.fromJson(json.decode(response.body));

    if (cardNamed.getObject == "error") {
      setState(() {
        isLoading = false;
        isSearchReturnedCard = false;
      });
    } else {
      setState(() {
        isLoading = false;
        isSearchReturnedCard = true;
      });
    }
  }
}

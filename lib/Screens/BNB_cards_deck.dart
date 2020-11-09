import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Database/Card.dart';
import 'package:flutter_project/Database/cards_deck.dart';
//import 'package:flutter_project/models/CardsDeck.dart';
import 'package:flutter_project/models/alert_dialog.dart';
import 'package:flutter_project/models/loading_icon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_project/Database/Users_Database.dart';
import '../services/server_database.dart';
import 'package:provider/provider.dart';
import '../Database/Users_Database.dart';

class CardViewer extends StatefulWidget {
  @override
  _CardViewerState createState() => _CardViewerState();
}

class _CardViewerState extends State<CardViewer> {
  @override
  void initState() {
    super.initState();
  }

  //---------------------------------
  CardDeck _cardDeck = new CardDeck(name: "name", manaType: "fire");

  bool toggleDeckBuilder = false;
  bool isBuildNewDeck;
  bool isDeckEmpty = false;

  CardVM cardNamed;

  bool canCallReturnResult = false;
  bool isSearchReturnedCard = false;
  bool isLoading = false;
  bool canAddCard = false;

  bool canGetCard = false;

  int cardsAddedNumber = 0;

  TextEditingController searchName = TextEditingController();
  //---------------------------------

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return StreamBuilder<UserCardsList>(
      stream: DatabaseService(uid: user.uid).userCardsList,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          //isDeckEmpty = false;
          UserCardsList userCardsList = snapshot.data;
          return FutureBuilder(
            future: fillNewCardDeck(userCardsList.cardsList),
            builder: (_, snap) {
              print("inside builder");
              return buildApp();
            },
          );
          //print("Cards page: snapshot has data");
          // fillNewCardDeck(userCardsList.cardsList);
          //return Container();
        } else {
          print("Cards page: snapshot.hasData is FALSE");
          return Container(
            child: Text(
              "You do not have any deck of cards.",
              style: TextStyle(
                fontFamily: ("Grenze-Light"),
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }
      },
    );
  }

  //_____________________________________________________________________________________________________________________
  //.then((){buildApp();})
  Future fillNewCardDeck(List<dynamic> listDynamic) async {
    List<String> list = new List<String>();
    listDynamic.forEach((element) {
      list.add(element.toString());
    });
    var response;
    list.forEach((e) async {
      String tempE = e.toString();
      response = await http.get(tempE);
      _cardDeck.addCardToDeck(new CardVM.fromJson(json.decode(response.body)));
      print("inside myFunction, ${_cardDeck.returnListLength()}");
      print("++++++++ $tempE");
    });
  }

  //_____________________________________________________________________________________________________________________
  Widget buildApp() {
    print("inside buildApp");
    print("number of cads: ${_cardDeck.returnListLength()}");
    return SingleChildScrollView(
      //child: Column(
      //children: <Widget>[
      // --- Title ---
      // Container(
      //   alignment: Alignment.center,
      //   //padding: EdgeInsets.all(5.0),
      //   margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
      //   width: MediaQuery.of(context).size.width,
      //   height: 60.0,
      //   decoration: BoxDecoration(
      //     color: Colors.black12,
      //     borderRadius: BorderRadius.all(Radius.circular(10.0)),
      //   ),
      //   child: Container(
      //     child: Text(
      //       "Current deck of cards",
      //       style: TextStyle(
      //         fontFamily: ("Grenze-Light"),
      //         fontSize: 30.0,
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ),
      // --- build list view ---
      child: Container(
        height: MediaQuery.of(context).size.height,
        //child: buildListView(context, _cardDeck.returnListLength()),
        // child: ListView.builder(
        //   scrollDirection: Axis.vertical,
        //   shrinkWrap: true,
        //   //itemExtent: 135,
        //   itemCount: _cardDeck.returnCardsNumber(),
        //   itemBuilder: (BuildContext context, int index) {
        //     //--
        //     // #TODO Update the values of the Item builder
        //     // String name = _cardDeck.returnCardName(index);
        //     // String text = _cardDeck.returnCardOracleText(index);
        //     // String cardImage = _cardDeck.returnCardImage(index, "art_crop");
        //     //--
        //     return Container(
        //       child: Card(
        //         child: Column(
        //           mainAxisSize: MainAxisSize.min,
        //           children: <Widget>[
        //             ListTile(
        //               leading: Icon(Icons.content_copy),
        //               //leading: Image.network(cardImage),
        //               title: Text("Cards Name:"), //${_cardDeck.returnCardName(index)}
        //               subtitle: Text('Oracle Text'), //${_cardDeck.returnCardOracleText(index)}
        //             ),
        //             Row(
        //               mainAxisAlignment: MainAxisAlignment.end,
        //               children: <Widget>[
        //                 Container(
        //                   child: FlatButton(
        //                     child: Text('View Card'),
        //                     color: Colors.black26,
        //                     onPressed: () {
        //                       //cardBottomSheetViewer (context, cardImage);
        //                     },
        //                   ),
        //                 ),
        //                 ButtonTheme(
        //                   minWidth: 50,
        //                   child: FlatButton(
        //                     onPressed: () {},
        //                     child: Icon(
        //                       Icons.remove_circle,
        //                       color: Colors.red,
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
        //child: Image.network(_cardDeck.returnCardImage(0, "large")),
      ),
      // isDeckEmpty ? buildDeckButton(context, "Create new") : buildDeckButton(context, "Edit deck"),
      // toggleDeckBuilder
      //     ? isBuildNewDeck ? creatingNewDeck(context) : Container() //<--- edit deck
      //     : Container(),
      //],
      //),
    );
  }
  //_____________________________________________________________________________________________________________________

  // Widget buildListView(BuildContext context, int length) {
  //   return Container(
  //     padding: EdgeInsets.all(8.0),
  //     margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
  //     width: MediaQuery.of(context).size.width,
  //     height: MediaQuery.of(context).size.height / 2,
  //     decoration: BoxDecoration(
  //       color: Colors.black12,
  //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
  //     ),
  //     // ------------------------------ ListView Builder
  //     child: ListView.builder(
  //       //scrollDirection: Axis.vertical,
  //       //shrinkWrap: true,
  //       //itemExtent: 135,
  //       itemCount: length, //_cardDeck.returnCardsNumber(),
  //       itemBuilder: (BuildContext context, int index) {
  //         //--
  //         // #TODO Update the values of the Item builder
  //         // String name = _cardDeck.returnCardName(index);
  //         // String text = _cardDeck.returnCardOracleText(index);
  //         // String cardImage = _cardDeck.returnCardImage(index, "art_crop");
  //         //--
  //         return Container(
  //           child: Card(
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: <Widget>[
  //                 ListTile(
  //                   leading: Icon(Icons.content_copy),
  //                   //leading: Image.network(cardImage),
  //                   title: Text("Cards Name:"), //${_cardDeck.returnCardName(index)}
  //                   subtitle: Text('Oracle Text'), //${_cardDeck.returnCardOracleText(index)}
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: <Widget>[
  //                     Container(
  //                       child: FlatButton(
  //                         child: Text('View Card'),
  //                         color: Colors.black26,
  //                         onPressed: () {
  //                           //cardBottomSheetViewer (context, cardImage);
  //                         },
  //                       ),
  //                     ),
  //                     ButtonTheme(
  //                       minWidth: 50,
  //                       child: FlatButton(
  //                         onPressed: () {},
  //                         child: Icon(
  //                           Icons.remove_circle,
  //                           color: Colors.red,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget creatingNewDeck(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return Column(
      children: <Widget>[
        // ------------------------------ Search Widget
        Column(
          children: <Widget>[
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
                        width: 150.0,
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
                      Container(
                        // --- Add card Button ---
                        height: 50.0,
                        width: 150.0,
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
                            if (canAddCard) {
                              _cardDeck.addCardToDeck(cardNamed);
                              setState(() {
                                cardsAddedNumber = _cardDeck.returnCardsNumber();
                                canAddCard = false;
                              });
                            } else {
                              showCustomDialog("SearchError", context);
                            }
                          },
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "Add",
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
        // ------------------------------ Finish  Widget
        SizedBox(height: 10.0),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: 2.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Cards added: $cardsAddedNumber",
                style: TextStyle(
                  fontFamily: ("Grenze-Light"),
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                // --- Search Button ---
                height: 50.0,
                width: 150.0,
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
                // ------------------------------------------------------------------- Finish Button
                child: RaisedButton(
                  onPressed: () {
                    DatabaseService(uid: user.uid).setUserCards(_cardDeck.cardsToLinks());
                  },
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: Text(
                    "Finish",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: ("Grenze-Light"),
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildDeckButton(BuildContext context, String title) {
    return Container(
      // --- show deck builder Button ---
      height: 50.0,
      width: 150.0,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent[400],
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(3, 3), // changes position of shadow
          ),
        ],
      ),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            if (title == "Edit current deck") {
              isBuildNewDeck = false;
            } else {
              isBuildNewDeck = true;
            }
            toggleDeckBuilder = !toggleDeckBuilder;
          });
        },
        color: Colors.blueAccent[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: ("Grenze-Light"),
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
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
        canAddCard = true;
      });
    }
  }

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
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: Image.network(cardNamed.imageUris["large"]),
              ),
              SizedBox(height: 10.0),
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

  void cardBottomSheetViewer(BuildContext context, String uri) {
    showBottomSheet(
      context: context,
      //shape: ShapeBorder(),
      builder: (BuildContext build) {
        return Container(
          color: Colors.white,
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              Text(
                "Swipe down to close",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: ("Grenze-Light"),
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Image.network(uri),
            ],
          ),
        );
      },
    );
  }

  void getCards(List<dynamic> listOfCards) {
    _cardDeck.linksToCards(listOfCards);
  }
}

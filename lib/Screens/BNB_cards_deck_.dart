import 'package:flutter/material.dart';
import 'package:flutter_project/Database/Card.dart';
import 'package:flutter_project/Database/Users_Database.dart';
import 'package:flutter_project/services/server_database.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StreamBuilderCards extends StatefulWidget {
  @override
  _StreamBuilderCardsState createState() => _StreamBuilderCardsState();
}

List<String> cardsList = new List<String>();
bool lockStream = false;
bool lockCardsBuilder = false;
int counter = 0;
int counterC = 0;
bool isFillerFinished = false;
bool lockListViewBuilder = false;
List<CardVM> deck = new List<CardVM>();

class _StreamBuilderCardsState extends State<StreamBuilderCards> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    return StreamBuilder<UserCardsList>(
        stream: DatabaseService(uid: user.uid).userCardsList,
        builder: (BuildContext context, snapshot) {
          UserCardsList userCardsList = snapshot.data;
          counter++;
          if (!lockStream && counter >= 6) {
            userCardsList.cardsList.forEach((element) {
              cardsList.add(element.toString());
            });
            lockStream = true;
            print("cards List ################ \n ${cardsList[0]} \n ${cardsList[0]} \n ##########################");
          }
          return CardsScreen();
        });
  }
}

class CardsScreen extends StatefulWidget {
  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  Widget build(BuildContext context) {
    if (counter >= 6) {
      fillNewCardDeck();
    }
    if (!isFillerFinished) {
      print("Loading ...");
      return Container(
        child: Center(child: Text("Loading ...")),
      ); //loading screen
    } else {
      print("list View Builder --->");
      return ListView.builder(
        itemCount: deck.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.content_copy),
                    title: Text("Cards Name: ${deck[index].name}"),
                    subtitle: Text('Oracle Text'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        child: FlatButton(
                          child: Text('View Card'),
                          color: Colors.black26,
                          onPressed: () {},
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 50,
                        child: FlatButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    }
  }
}

void fillNewCardDeck() async {
  print("########### fill New Card Deck");
  List<String> list = new List<String>();
  cardsList.forEach((element) {
    list.add(element.toString());
  });
  var response;
  list.forEach((e) async {
    String tempE = e.toString();
    response = await http.get(tempE);
    deck.add(new CardVM.fromJson(json.decode(response.body)));
    counterC++;
    print("counterC $counterC #### cardsList.length");
    if (counterC == cardsList.length) {
      //setState(() {
      print("create list view builder --->");
      isFillerFinished = true;
      //lockCardsBuilder = true;
      //});
    }
  });
}

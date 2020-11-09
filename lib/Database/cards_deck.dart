import 'package:flutter_project/Database/Card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CardDeck {
  String name;
  String manaType;
  int cardsNumber = 0;

  CardDeck({this.name, this.manaType});

  List<CardVM> _cardDeckList = new List<CardVM>();

  void addCardToDeck(CardVM card) {
    _cardDeckList.add(card);
    cardsNumber++;
  }

  int returnListLength() {
    return _cardDeckList.length;
  }

  String returnCardName(int index) {
    return _cardDeckList[index].name;
  }

  String returnCardImage(int index, String imageType) {
    return _cardDeckList[index].imageUris[imageType];
  }

  String returnCardOracleText(int index) {
    if (_cardDeckList[index].oracleText != "" || _cardDeckList[index].oracleText != null) {
      return _cardDeckList[index].oracleText;
    } else {
      return "No Oracle Text";
    }
  }

  List<String> cardsToLinks() {
    List<String> tempList = new List<String>();
    _cardDeckList.forEach((element) {
      tempList.add(element.uri);
    });
    return tempList;
  }

  void linksToCards(List<dynamic> list) {
    list.cast<String>().toList();
    var response;
    _cardDeckList.clear();
    list.forEach((e) async {
      response = await http.get(e);
      print("++++++++++ response: $response");
      _cardDeckList.add(new CardVM.fromJson(json.decode(response.body)));
    });
  }

  int returnCardsNumber() {
    return cardsNumber;
  }

  void changeName(String newName) {
    name = newName;
  }

  void changeManaType(String newType) {
    name = newType;
  }
}

import 'package:flutter/cupertino.dart';
import '../Database/Card.dart';

class CardsDeck with ChangeNotifier {
  List<CardVM> cardsDeck;

  void addCard(CardVM c) {
    cardsDeck.add(c);
    notifyListeners();
  }
}

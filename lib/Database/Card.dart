class CardVM {
  String getObject;
  Map<String, String> imageUris;
  String name;
  String linkToCard;
  String typeLine;
  String oracleText;
  String powerN;
  String toughnessN;
  List<dynamic> cardColors;

  String uri;

  CardVM({
    this.name,
    this.imageUris,
    this.linkToCard,
    this.typeLine,
    this.oracleText,
    this.powerN,
    this.toughnessN,
    this.cardColors,
    this.getObject,
    this.uri,
  });

  factory CardVM.fromJson(Map<String, dynamic> json) {
    //
    if (json["object"] == "error") {
      print(" -------- API call object error --------");
      return CardVM(
        name: null,
        imageUris: null,
        linkToCard: null,
        typeLine: null,
        oracleText: null,
        powerN: null,
        toughnessN: null,
        cardColors: null,
        getObject: json["object"],
      );
    } else {
      Map<String, dynamic> tempDic = json["image_uris"];
      Map<String, String> myDic = Map<String, String>();
      tempDic.forEach((key, value) {
        myDic[key] = value;
      });

      List<dynamic> tempColors = json["colors"];

      // print("------------ Link:");
      // print("------------ ${json["scryfall_uri"]}");
      // print("-------------------------------------------------------");

      return CardVM(
        name: json["name"],
        imageUris: myDic,
        linkToCard: json["scryfall_uri"],
        typeLine: json["type_line"],
        oracleText: json["oracle_text"],
        powerN: json["power"],
        toughnessN: json["toughness"],
        cardColors: tempColors,
        getObject: json["object"],
        uri: json["uri"],
      );
    }
  }

  void extractURI(String jsonUri) {
    //uri = jsonUri;
  }
}

class CardList {
  int searchLength = 0;
  //bool search
  List<CardVM> cardList = [];
  CardList();

  factory CardList.fromJson(Map<String, dynamic> json) {
    return CardList();
  }
}

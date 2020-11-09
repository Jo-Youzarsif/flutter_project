import 'package:flutter/material.dart';

class CardsDeckTemp extends StatefulWidget {
  @override
  _CardsDeckState createState() => _CardsDeckState();
}

class _CardsDeckState extends State<CardsDeckTemp> {
  TextStyle styleT = TextStyle(fontFamily: ("Grenze-Light"), fontSize: 18.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
              width: MediaQuery.of(context).size.width,
              height: 60.0,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Container(
                child: Text(
                  "Current deck of cards",
                  style: TextStyle(
                    fontFamily: ("Grenze-Light"),
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(3.0),
              margin: EdgeInsets.symmetric(vertical: 2.0, horizontal: 2.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(
                                "https://c1.scryfall.com/file/scryfall-cards/art_crop/front/2/c/2c15d933-63f3-42d5-aed4-0e420ee4a7d9.jpg?1561756837"),
                            title: Text("Cards Name: Genju of the Spires", style: styleT),
                            subtitle: Text("Type line: Enchantment — Aura", style: styleT),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: FlatButton(
                                  child: Text('View Card', style: styleT),
                                  color: Colors.black26,
                                  onPressed: () {
                                    cardBottomSheetViewer(context,
                                        "https://c1.scryfall.com/file/scryfall-cards/large/front/2/c/2c15d933-63f3-42d5-aed4-0e420ee4a7d9.jpg?1561756837");
                                  },
                                ),
                              ),
                              ButtonTheme(
                                minWidth: 50,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(
                                "https://c1.scryfall.com/file/scryfall-cards/art_crop/front/d/5/d528045d-3b80-48fd-b606-c132da052685.jpg?1562934816"),
                            title: Text("Cards Name: Circle of Protection: Black", style: styleT),
                            subtitle: Text("Type line: Enchantment", style: styleT),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: FlatButton(
                                  child: Text('View Card', style: styleT),
                                  color: Colors.black26,
                                  onPressed: () {
                                    cardBottomSheetViewer(context,
                                        "https://c1.scryfall.com/file/scryfall-cards/large/front/d/5/d528045d-3b80-48fd-b606-c132da052685.jpg?1562934816");
                                  },
                                ),
                              ),
                              ButtonTheme(
                                minWidth: 50,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Image.network(
                                "https://c1.scryfall.com/file/scryfall-cards/art_crop/front/9/b/9ba0ace8-dcc0-4ecb-bc5a-156577a52684.jpg?1575571857"),
                            title: Text("Cards Name: Gluttonous Slime", style: styleT),
                            subtitle: Text("Type line: Creature — Ooze", style: styleT),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                child: FlatButton(
                                  child: Text('View Card', style: styleT),
                                  color: Colors.black26,
                                  onPressed: () {
                                    cardBottomSheetViewer(context,
                                        "https://c1.scryfall.com/file/scryfall-cards/large/front/9/b/9ba0ace8-dcc0-4ecb-bc5a-156577a52684.jpg?1575571857");
                                  },
                                ),
                              ),
                              ButtonTheme(
                                minWidth: 50,
                                child: FlatButton(
                                  onPressed: () {},
                                  child: Icon(
                                    Icons.remove_circle,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              //padding: EdgeInsets.all(5.0),
              margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 0.0),
              width: MediaQuery.of(context).size.width,
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Container(
                //margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                height: 160.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      // --- Search Button ---
                      height: 50.0,
                      width: 170.0,
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
                        onPressed: () {},
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          "Edit Deck",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: ("Grenze-Light"),
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    Container(
                      // --- Search Button ---
                      height: 50.0,
                      width: 170.0,
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
                        onPressed: () {},
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          "Create New",
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
            ),
          ],
        ),
      ),
    );
  }

  //-----------------------------------------------------------------------
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
}

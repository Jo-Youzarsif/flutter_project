import 'package:flutter/material.dart';
import 'package:flutter_project/Database/Users_Database.dart';
import '../services/server_database.dart';
import 'package:provider/provider.dart';
import '../Database/Users_Database.dart';

class BNBProfileScreen extends StatefulWidget {
  @override
  _BNBProfileScreenState createState() => _BNBProfileScreenState();
}

class _BNBProfileScreenState extends State<BNBProfileScreen> {
  //--
  bool _isNewUser = false;
  bool _NewUserLocked = false;
  final List<String> ranksList = ["Bronze", "Silver", "Gold", "Platinum", "Diamond", "Mythic"];
  final List<String> ranksLeague = ["Wizard 2016", "Wizard 2017", "Wizard 2018", "Wizard 2019", "Wizard 2020", "Wizard 2021"];

  TextEditingController cardsText = TextEditingController();

  // String holderName = "name";
  // String holderUsername = "username";
  // String holderRank = "rank";
  // String holderLeague = "league";
  // String holderCards = "0";
  String holderName;
  String holderUsername;
  String holderRank;
  String holderLeague;
  String holderCards;
  //--
  @override
  Widget build(BuildContext context) {
    //--
    final user = Provider.of<AppUser>(context);
    return StreamBuilder<UserData>(
      stream: DatabaseService(uid: user.uid).userData,
      builder: (BuildContext context, snapshot) {
        if (snapshot.hasData) {
          print("Profile page: snapshot has data");
          UserData userData = snapshot.data;
          //--
          //checking is user is new
          if (userData.name == "name" && !_NewUserLocked) {
            print(userData.name);
            _NewUserLocked = true;
            _isNewUser = true;
          }
          // holderName = userData.name;
          // holderUsername = userData.username;
          // holderRank = userData.rank;
          // holderLeague = userData.league;
          // holderCards = userData.cardsNumber.toString();
          // holderName = null;
          // holderUsername = null;
          // holderRank = null;
          // holderLeague = null;
          // holderCards = null;
          //--
          return Scaffold(
            backgroundColor: Colors.black12,
            body: Center(
              child: SingleChildScrollView(
                child: _isNewUser
                    ? Column(
                        children: <Widget>[
                          // ---------------- Logo ----------------
                          Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(15.0),
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
                            child: Image.asset(
                              "Assets/Images/logo.png",
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 1.2,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // --------- enter data Text box --------
                          Container(
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
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 1.13,
                              alignment: Alignment.center,
                              child: Text(
                                "Please enter your data",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: ("Grenze-Light"),
                                  fontSize: 33.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // ---------------- ---------------- enter name ----------------
                          Container(
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
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 1.13,
                              alignment: Alignment.center,
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23.0,
                                  fontFamily: ("Grenze-Light"),
                                ),
                                onChanged: (text) {
                                  holderName = text;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 5,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  labelText: 'Name:',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // ---------------- ---------------- enter username ----------------
                          Container(
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
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 1.13,
                              alignment: Alignment.center,
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23.0,
                                  fontFamily: ("Grenze-Light"),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    holderUsername = text;
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 5,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  labelText: 'Username:',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // ---------------- ---------------- enter Rank ----------------
                          Container(
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
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 1.13,
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                                child: DropdownButton(
                                  value: holderRank,
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 20,
                                  //elevation: 60,
                                  isExpanded: true,
                                  hint: Text(
                                    "Rank:",
                                    style: TextStyle(
                                      fontFamily: ("Grenze-Light"),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 25.0,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepOrange,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      holderRank = newValue;
                                    });
                                  },
                                  items: ranksList.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          value,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: ("Grenze-Light"),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // ---------------- ---------------- enter League ----------------
                          Container(
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
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 1.13,
                              alignment: Alignment.center,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
                                child: DropdownButton(
                                  value: holderLeague,
                                  icon: Icon(Icons.arrow_downward),
                                  iconSize: 20,
                                  //elevation: 60,
                                  isExpanded: true,
                                  hint: Text(
                                    "League:",
                                    style: TextStyle(
                                      fontFamily: ("Grenze-Light"),
                                    ),
                                  ),
                                  style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: 25.0,
                                  ),
                                  underline: Container(
                                    height: 2,
                                    color: Colors.deepOrange,
                                  ),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      holderLeague = newValue;
                                    });
                                  },
                                  items: ranksLeague.map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          value,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: ("Grenze-Light"),
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // ---------------- ---------------- enter Cards number ----------------
                          Container(
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
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
                              height: 50.0,
                              width: MediaQuery.of(context).size.width / 1.13,
                              alignment: Alignment.center,
                              child: TextField(
                                textAlign: TextAlign.center,
                                keyboardType: TextInputType.number,
                                controller: cardsText,
                                style: TextStyle(
                                  fontSize: 23.0,
                                  fontFamily: ("Grenze-Light"),
                                ),
                                onChanged: (text) {
                                  setState(() {
                                    if (int.parse(text) > 300) {
                                      holderCards = "300";
                                      cardsText.text = "300";
                                    } else {
                                      holderCards = text;
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      width: 5,
                                      style: BorderStyle.solid,
                                    ),
                                  ),
                                  labelText: 'Cards number:',
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          // ---------------- Update ----------------
                          Container(
                            // --- Search Button ---
                            height: 45.0,
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
                              onPressed: () async {
                                await DatabaseService(uid: user.uid).setUserData(
                                  holderName ?? userData.name,
                                  holderRank ?? userData.rank,
                                  holderUsername ?? userData.username,
                                  holderLeague ?? userData.league,
                                  int.parse(holderCards) ?? userData.cardsNumber,
                                );
                                //--
                                setState(() {
                                  _isNewUser = false;
                                });
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "Update",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: ("Grenze-Light"),
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(5.0),
                            padding: EdgeInsets.all(15.0),
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
                            child: Image.asset(
                              "Assets/Images/logo.png",
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 1.2,
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          profileRow(context, "Name", userData.name),
                          profileRow(context, "Username", userData.username),
                          profileRow(context, "Rank", userData.rank),
                          profileRow(context, "League", userData.league),
                          profileRow(context, "Cards", "${userData.cardsNumber} / 300"),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            // --- update Button ---
                            height: 50.0,
                            width: 180.0,
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
                                setState(() {
                                  _isNewUser = true;
                                });
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Text(
                                "Update Information",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: ("Grenze-Light"),
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                        ],
                      ),
              ),
            ),
          );
        } else {
          print("Profile page: snapshot.hasData is FALSE");
          return Container();
        }
      },
    );
  }

  Widget profileRow(BuildContext context, String option, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 4.0),
      height: 70.0,
      width: MediaQuery.of(context).size.width / 1.1,
      child: Container(
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            SizedBox(
              width: 10.0,
            ),
            Text(
              "$option:",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: ("Grenze-Light"),
                fontSize: 33.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              "$value",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontFamily: ("Grenze-Light"),
                fontSize: 33.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}

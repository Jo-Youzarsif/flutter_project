import 'package:flutter/material.dart';

class SearchPageField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: EdgeInsets.symmetric(vertical: 2.4, horizontal: 5.0),
      decoration: BoxDecoration(
        color: Colors.teal,
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
            width: 255.0,
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
                //controller: searchName,
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
    );
  }
}

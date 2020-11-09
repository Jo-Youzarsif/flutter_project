import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_project/Database/Users_Database.dart';

class DatabaseService {
  //--
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCardsCollections = FirebaseFirestore.instance.collection("Magic");
  final CollectionReference userCardsCollections2 = FirebaseFirestore.instance.collection("CardsList");

  // --------- set user data ---------
  Future setUserData(
    String name,
    String rank,
    String username,
    String league,
    int cardsNumber,
  ) async {
    return await userCardsCollections.doc(uid).set({
      "name": name,
      "rank": rank,
      "username": username,
      "league": league,
      "cardsNumber": cardsNumber,
    });
  }

  Future setUserCards(
    List<String> cardsList,
  ) async {
    return await userCardsCollections2.doc(uid).set({
      "cardsList": cardsList,
    });
  }

  // --------- users data List from snapshot ---------
  List<UsersSnapShot> _usersListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return UsersSnapShot(
        name: doc.data()["name"].toString() ?? "",
        username: doc.data()["username"].toString() ?? "",
        rank: doc.data()["rank"].toString() ?? "",
        league: doc.data()["league"].toString() ?? "",
        cardsNumber: doc.data()["cardsNumber"] ?? 1,
      );
    }).toList();
  }

  //--------- get user from snapshot ---------
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: snapshot.data()["uis"].toString() ?? "",
      name: snapshot.data()["name"].toString() ?? "",
      username: snapshot.data()["username"].toString() ?? "",
      rank: snapshot.data()["rank"].toString() ?? "",
      league: snapshot.data()["league"].toString() ?? "",
      cardsNumber: snapshot.data()["cardsNumber"] ?? 1,
    );
  }

  //--------- get user data ---------
  Stream<UserData> get userData {
    return userCardsCollections.doc(uid).snapshots().map(_userDataFromSnapshot);
  }

  // --------- get user CardsList ---------
  Stream<UserCardsList> get userCardsList {
    return userCardsCollections2.doc(uid).snapshots().map(_userCardsListFromSnapshot);
  }

  UserCardsList _userCardsListFromSnapshot(DocumentSnapshot snapshot) {
    return UserCardsList(
      cardsList: snapshot.data()["cardsList"] ?? ["error"],
    );
  }

  // --------- get users data ---------
  Stream<List<UsersSnapShot>> get getUsersData {
    return userCardsCollections.snapshots().map((_usersListFromSnapshot));
  }
}

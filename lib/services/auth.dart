import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_core/firebase_core.dart';
import '../Database/Users_Database.dart';
import 'server_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser _fromFirebaseUser(User user) {
    return user != null ? AppUser(uid: user.uid) : null;
  }

  // --------- get user info ---------
  Stream<AppUser> get user {
    return _auth.authStateChanges().map(_fromFirebaseUser); // same as what is bellow!
    //return _auth.authStateChanges().map((User userFB) => _fromFirebaseUser(userFB));
  }

  // --------- sign in user anonymously ---------
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _fromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // --------- sign in user with email and password ---------
  Future signInUserEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User userFB = result.user;
      return _fromFirebaseUser(userFB);
    } catch (e) {
      print("Signing in with Email and Password failed, Error: ${e.toString()}");
      return null;
    }
  }

  // --------- register user with email and password ---------
  Future registerUserEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User userFB = result.user;
      await DatabaseService(uid: userFB.uid).setUserData("name", "rank", "username", "league", 0);
      return _fromFirebaseUser(userFB);
    } catch (e) {
      print("Signing in with Email and Password failed, Error: ${e.toString()}");
      return null;
    }
  }

  // --------- sign out user ---------
  Future signUserOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print("Signing out failed, error: ${e.toString()}");
      return null;
    }
  }
}

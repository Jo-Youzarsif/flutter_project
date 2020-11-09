import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/Screens/Register.dart';
import 'package:flutter_project/Screens/login_page.dart';
import 'package:flutter_project/services/auth.dart';
import 'Screens/Home.dart';
import 'Database/Users_Database.dart';
import 'package:provider/provider.dart';
import 'Screens/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppUser(),
        ),
      ],
      child: MaterialApp(
        home: WrapperState(),
        theme: ThemeData(
          backgroundColor: Colors.black12,
        ),
        routes: {
          "Home": (context) => HomePage(),
          "LoginScreen": (context) => LoginPage(),
          "Register": (context) => RegisterNewUser(),
        },
      ),
    );
  }
}

class WrapperState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AppUser>.value(
      value: AuthService().user,
      child: Wrapper(),
    );
  }
}

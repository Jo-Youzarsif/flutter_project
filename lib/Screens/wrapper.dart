import 'package:flutter/material.dart';
import 'package:flutter_project/main.dart';
import 'package:provider/provider.dart';
import '../Database/Users_Database.dart';
import 'login_page.dart';
import 'Home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GoToUserPage();
  }
}

class GoToUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);

    if (user == null) {
      return LoginPage();
    } else {
      return HomePage();
    }
  }
}

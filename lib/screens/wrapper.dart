import 'package:brew_crew_firebase/models/user.dart';
import 'package:brew_crew_firebase/screens/authenticate/authenticate.dart';
import 'package:brew_crew_firebase/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either home or authenticate  
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
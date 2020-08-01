import 'package:Shareable/screens/login_screen.dart';
import 'package:Shareable/sidebar/sidebar_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckLogin extends StatefulWidget {
  @override
  _CheckLogin createState() => _CheckLogin();
}

class _CheckLogin extends State<CheckLogin> {
  @override
  void initState() {
    super.initState();
    var auth = FirebaseAuth.instance;
    auth.onAuthStateChanged.listen((user) {
      if (user != null) {
        print("user is logged in");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SideBarLayout()));
        //navigate to home page using Navigator Widget
      } else {
        print("user is not logged in");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
         //navigate to sign in page using Navigator Widget
      }
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold();
  }
}
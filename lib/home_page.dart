import 'package:demo/login_image.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GoogleSignIn googleSignIn = new GoogleSignIn();

  //signout method
  void _signOut(){
    googleSignIn.signOut();
    print("User Signed Out");
    Navigator.of(context).pushNamed(LoginPage.tag);

  }
  @override
  Widget build(BuildContext context) {
    return Container(child: new Container(
      child: RaisedButton(
          onPressed: () => _signOut(),
      ),
    ),);
  }
}

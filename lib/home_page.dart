import 'package:demo/login_image.dart';
import 'package:demo/services/authentication.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  HomePage({this.auth,this.onSignedOut});
  BaseAuth auth;
  VoidCallback onSignedOut;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  void _signOut() async{
    try{
      await widget.auth.signedOut();
      widget.onSignedOut();

    }
    catch(e){print(e);}
  }
//  GoogleSignIn googleSignIn = new GoogleSignIn();
//
//  //signout method
//  void _signOut(){
//    googleSignIn.signOut();
//    print("User Signed Out");
//    Navigator.of(context).pushNamed(LoginPage.tag);
//
//  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('welcome'),
        actions: <Widget>[
          new FlatButton(
              onPressed: _signOut,
              child: new Text('Logout',style: new TextStyle(
                      fontSize: 17.0,
                      color: Colors.white,

              ),
              ),
          ),
        ],
      ),
      body: new Container(
      child: new Text("Welcome dude"),

    ),);
  }
}

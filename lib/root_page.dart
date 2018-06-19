import 'package:demo/home_page.dart';
import 'package:demo/login_image.dart';
import 'package:demo/services/authentication.dart';
import 'package:demo/signup_page.dart';
import 'main.dart';
import 'package:flutter/material.dart';


class RootPage extends StatefulWidget{
  RootPage({this.auth});
  final UserAuth auth;


  @override
  State<StatefulWidget> createState() => new _RootPageState();
}
enum AuthStatus{
  notSignedIn,
  SignedIn
}
class _RootPageState extends State<RootPage>{
  AuthStatus _authStatus = AuthStatus.notSignedIn;
  @override
   initState()  {

    super.initState();
     widget.auth.currentUser().then((userID){
       setState(() {
          _authStatus = userID == null ? AuthStatus.notSignedIn : AuthStatus.SignedIn;
       });
     });
  }

  void _signedIn(){
    setState(() {
    _authStatus = AuthStatus.SignedIn;
    });
  }
  void _signedout(){
    setState(() {
      _authStatus = AuthStatus.notSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {

    switch(_authStatus){
      case AuthStatus.notSignedIn:
        return new LoginPage(
            auth: widget.auth,
            onSignedIn: _signedIn ,
        );
      case AuthStatus.SignedIn:
        return new HomePage(
            auth: widget.auth,
          onSignedOut: _signedout,
        );

    }

  }
}

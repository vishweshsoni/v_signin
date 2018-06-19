import 'package:demo/services/authentication.dart';
import 'package:demo/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:demo/home_page.dart';
import 'package:demo/root_page.dart';
import 'package:demo/login_image.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(auth: new UserAuth()),
     HomePage.tag : (context) => HomePage(),
    Signup.tag : (context) => Signup(auth: new UserAuth()),
  };

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title:'LoginPage',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Nunito'
      ),
      home: RootPage(auth: new UserAuth()),
      routes: routes,

    );
  }
}
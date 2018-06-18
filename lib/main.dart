import 'package:flutter/material.dart';
import 'package:demo/home_page.dart';
import 'package:demo/login_image.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
     HomePage.tag : (context) => HomePage(),
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
      home: LoginPage(),
      routes: routes,

    );
  }
}
import 'package:demo/login_image.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  static String tag = 'signup-page';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  FormType _formtype= FormType.register;
  String  _username;
  String _email;
  String _password;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final image = Container(
      child: new Stack(
        children: <Widget>[
          new ClipPath(
            child: new Image.asset('images/food.jpg'),
            clipper: new BottomClipper(),
          ),

        ],
        ),
    );
    final box = Container(
      child: new Container(
        child: Row(
          children: <Widget>[
            new Stack(
              children: <Widget>[
                new Container(
                  height: 250.0,
                  width: 250.0,
                  margin: new EdgeInsets.only(top: 45.0, left: 30.0),
                  child: new Form(

                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      autocorrect: true,
//                      validator: validations.validateEmail,
//                      onSaved: (String email){
//                        user.email =email;
//                      },
                      validator: (val) =>
                      !val.contains('@') ? 'Not a valid email' : null,
                      onSaved: (val) => _email = val,
                      decoration: InputDecoration(
                        icon: new Icon(Icons.email),
                        hintText: 'Email',
                        contentPadding:
                        EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                      ),
                    ),
                  ),
                ),
                new Container(
                  height: 100.0,
                  width: 250.0,
                  margin: new EdgeInsets.only(top: 105.0, left: 30.0),
                  child: TextFormField(
                    autofocus: false,
                    obscureText: true,
                    validator: (val) =>
                    val.length < 6 ? 'password too short' : null,
                    onSaved: (val) => _password = val,
                    decoration: InputDecoration(
                      icon: new Icon(Icons.lock_open),
                      hintText: 'password',
                      contentPadding:
                      EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0)),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      height: 400.0,
      margin: new EdgeInsets.only(left: 20.0, top: 140.0, right: 20.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        border: new Border.all(color: Colors.black12),
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.grey,
            spreadRadius: 10.0,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );
    final login = Padding(
      padding: EdgeInsets.only(top: 500.0, left: 80.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.redAccent.shade200,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 52.0,
//          onPressed: _submit,
          color: Colors.redAccent,
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    return Scaffold(
        key: _scaffoldKey,
        body: new Container(
          child: Stack(
            children: <Widget>[
              image,
              box,
              login,

            ],
          ),
        ));
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = new Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = new Offset(size.width / 2.0, size.height / 2.0);
    var firstEndPoint = new Offset(size.width, size.height);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'dart:async';
import 'package:demo/services/authentication.dart';
import 'package:demo/services/validation.dart';
import 'package:demo/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:demo/home_page.dart';
import 'package:demo/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  const LoginPage({Key key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext context;
  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String _email;
  String _password;

  ScrollController scrollController = new ScrollController();

  UserData user = new UserData();
  UserAuth userAuth = new UserAuth();
  bool autovalidate = false;
  Validation validations = new Validation();

  //another submit method easy
  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      _performLogin();
    }
  }

  void _performLogin() async {
    try {
      FirebaseUser user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: _email, password: _password);
    } catch (e) {
      print("error: $e");
    }
    final snackbar =
        new SnackBar(content: new Text('email : $_email,password:$_password'));
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  bool _flag = false;
  FirebaseAuth _auth = FirebaseAuth.instance;
  GoogleSignIn googleSignIn = new GoogleSignIn();
  //auto signin method
  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    FirebaseUser user = await _auth.signInWithGoogle(
      idToken: gSA.idToken,
      accessToken: gSA.accessToken,
    );

    print("User name :${user.displayName}");
    return user;
  }

  @override
  Widget build(BuildContext context) {
    Validation validations = new Validation();
    this.context = context;

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
                    key: formKey,
                    autovalidate: autovalidate,
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
      height: 185.0,
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

    //Forget password?
    final forget = new Container(
      margin: EdgeInsets.only(top: 368.0, left: 200.0),
      child: FlatButton(
        child: Text(
          'Forgot Password ?',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        onPressed: () {},
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
          onPressed: _submit,
          color: Colors.redAccent,
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );

    final Glogin = Padding(
      padding: EdgeInsets.only(top: 367.0, left: 20.0),
      child: MaterialButton(
        child: Image.asset(
          'images/google.png',
          height: 52.00,
          width: 40.0,
        ),
        onPressed: () => _signIn()
            .then((FirebaseUser user) =>
                Navigator.of(context).pushNamed(HomePage.tag))
            .catchError((e) => print(e)),
      ),
    );
    final signup = Container(
      margin: EdgeInsets.only(top: 570.0, left: 62.0),
      child: new FlatButton(
        child: RichText(
          text: new TextSpan(
            children: <TextSpan>[
              new TextSpan(
                 text: 'Dont\'t have an account? ',
                 style: new TextStyle(color: Colors.blueAccent.withOpacity(0.9),fontSize: 15.0),
              ),
              new TextSpan(
                text: ' SignUp',
                style: new TextStyle(color: Colors.blueAccent.shade700,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),

              ),
            ],

          ),


        ),
        onPressed: () => Navigator.of(context).pushNamed(Signup.tag),
      ),

    );

    return Scaffold(
        key: _scaffoldKey,
        body: new Container(
          child: Stack(
            children: <Widget>[
              image,
              box,
              forget,
              login,
              Glogin,
              signup
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

import 'package:demo/login_image.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  static String tag = 'signup-page';

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
 String _name;
 String _email;
 String _password;
 bool autovalidate = false;
 final GlobalKey<FormState> formKey = new GlobalKey<FormState>();
 final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
 @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      key:_scaffoldKey ,
      body: new Container(
        child: new Stack(
          children: <Widget>[
            new ClipPath(
              child: new Image.asset('images/food.jpg'),
              clipper: new BottomClipper(),
            ),
            new Container(
              child: new Form(
                  key: formKey,
                  autovalidate: autovalidate,
                  child:  new Container(
                    margin: EdgeInsets.all(12.0),
                    padding: EdgeInsets.all(1.0),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: <Widget>[
                        new TextFormField(

                          keyboardType: TextInputType.text,
                          autofocus: false,
                          autocorrect: true,
                          validator: (val) =>
                          val.length < 4 ? 'name not available' : null,
                          onSaved: (val) => _email = val,
                          decoration: InputDecoration(

                            icon: new Icon(Icons.person,size: 29.0,),
                            hintText: 'Username',
                            contentPadding: EdgeInsets.fromLTRB(18.0, 8.0, 20.0, 15.0),
                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                        ),


                        new TextFormField(

                          keyboardType: TextInputType.emailAddress,
                          autofocus: false,
                          autocorrect: true,
                          validator: (val) =>
                          !val.contains('@') ? 'Not a valid email' : null,
                          onSaved: (val) => _email = val,
                          decoration: InputDecoration(

                            icon: new Icon(Icons.email,size: 29.0,),
                            hintText: 'Email',
                            contentPadding: EdgeInsets.fromLTRB(18.0, 8.0, 20.0, 15.0),
                            border: OutlineInputBorder(

                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                        ),

                        new TextFormField(
                          autofocus: false,
                          obscureText: true,
                          validator: (val) =>
                          val.length < 6 ? 'password too short' : null,
                          onSaved: (val) => _password = val,
                          decoration: InputDecoration(
                            icon: new Icon(Icons.lock_open,size: 29.0,),
                            hintText: 'password',
                            contentPadding:
                            EdgeInsets.fromLTRB(18.0, 8.0, 20.0, 15.0),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
              height: 210.0,
              width: 320.0,
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
            ),
            Container(
              margin: EdgeInsets.only(top: 570.0, left: 62.0),
              child: new FlatButton(
                child: RichText(
                  text: new TextSpan(
                    children: <TextSpan>[
                      new TextSpan(
                        text: 'Already Registered ?',
                        style: new TextStyle(color: Colors.blueAccent.withOpacity(0.9),fontSize: 15.0),
                      ),
                      new TextSpan(
                        text: ' Login',
                        style: new TextStyle(color: Colors.blueAccent.shade700,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),

                      ),
                    ],
                  ),
                ),
                onPressed: () => Navigator.of(context).pushNamed(LoginPage.tag),
              ),
            ),
                  new Padding(
                          padding: EdgeInsets.only(top: 500.0, left: 80.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(30.0),
                            shadowColor: Colors.redAccent.shade200,
                            elevation: 5.0,
                            child: MaterialButton(
                              minWidth: 200.0,
                              height: 52.0,
//                              onPressed: _submit,
                              color: Colors.redAccent,
                              child: Text(
                                'Signup',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),

      ],
        ),
      ),
    );
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

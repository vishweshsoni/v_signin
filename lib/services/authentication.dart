import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class UserData{
  String displayName;
  String email;
  String uid;
  String password;
  UserData({this.displayName,this.email,this.password,this.uid});

}


class UserAuth{
 String statusMsg = "Account Created SuccessFully";

 //To create a new User
 Future<String> createUser(UserData userData) async{
   FirebaseAuth firebaseAuth = FirebaseAuth.instance;
   await firebaseAuth
          .createUserWithEmailAndPassword
           ( email: userData.email,
             password: userData.password);
   return statusMsg;

 }

 //To varify new User
  Future<String> varifyUser(UserData userData) async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    await firebaseAuth
            .signInWithEmailAndPassword
              (email: userData.email,
               password: userData.password
               );
    return "Login Successfully";
  }
}
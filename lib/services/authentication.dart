import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
   Future<String> signInWithEmailAndPassword(String email,String password);
   Future<String> createUserWithEmailAndPassword(String email,String password);
   Future<String> currentUser();
   Future<void> signedOut();
}
class UserAuth implements BaseAuth{
    //dont use firebase instance again agin
    final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;

    //for login of registered user
    Future<String> signInWithEmailAndPassword(String email,String password) async{
      FirebaseUser user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return user.uid;
    }
    //for signup user using email pass
    Future<String> createUserWithEmailAndPassword(String email,String password) async{
      FirebaseUser user =await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return user.uid;
    }

    //returns the current user so that u can get the instance
    Future<String> currentUser() async{
       FirebaseUser user = await _firebaseAuth.currentUser();
       return user.uid;
    }

    Future<void> signedOut() async{
      return FirebaseAuth.instance.signOut();
    }

}
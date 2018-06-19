import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuth{
   Future<String> signInWithEmailAndPassword(String email,String password);
   Future<String> createUserWithEmailAndPassword(String email,String password);
}
class UserAuth implements BaseAuth{
    Future<String> signInWithEmailAndPassword(String email,String password) async{
      FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return user.uid;
    }

    Future<String> createUserWithEmailAndPassword(String email,String password) async{
      FirebaseUser user =await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return user.uid;
    }

}
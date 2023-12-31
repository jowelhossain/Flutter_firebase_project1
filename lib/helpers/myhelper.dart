import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_project1/home_page.dart';
import 'package:flutter_firebase_project1/signin_screen.dart';

class MyHelper{

 Future signUp(email, password,context) async {

   try {
     final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: email,
       password: password,
     );
     if(credential.user!.uid.isNotEmpty){
Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
     }
   } on FirebaseAuthException catch (e) {
     if (e.code == 'weak-password') {
       print('The password provided is too weak.');
     } else if (e.code == 'email-already-in-use') {
       print('The account already exists for that email.');
     }
   } catch (e) {
     print(e);
   }
 }



 Future signIn(email, password,context) async {

   try {
     final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: email,
         password: password
     );
     if(credential.user!.uid.isNotEmpty){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninScreen()));
     }
   } on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
       print('No user found for that email.');
     } else if (e.code == 'wrong-password') {
       print('Wrong password provided for that user.');
     }
   }
 }
}
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_project1/home_page.dart';
import 'package:flutter_firebase_project1/register.dart';
class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
Center(child: Text("Log In Successful", style: TextStyle(color: Colors.orange, fontSize: 20),)),
           ElevatedButton(onPressed: (){
             Navigator.push(context, MaterialPageRoute(builder: (_)=>Register()));
           }, child: Text("Register")),
            ElevatedButton(onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                  HomePage()), (Route<dynamic> route) => false);
            }, child: Text("Log Out"))

          ],
        ),
      ),
    );
  }
}

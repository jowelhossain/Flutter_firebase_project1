import 'package:flutter/material.dart';
import 'package:flutter_firebase_project1/helpers/myhelper.dart';
import 'package:flutter_firebase_project1/signup.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(title: Text("Flutter Project1"),centerTitle: true,backgroundColor: Colors.white,),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.blueAccent,
child: Column(children: [
  TextField(
    controller: emailController,
    style: TextStyle(color: Colors.white),
    keyboardType: TextInputType.text,
    decoration: InputDecoration(
      floatingLabelStyle: TextStyle(color: Colors.white),
hintText: "Please Enter Your Email",
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(width: 2, color: Colors.white)
      ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 2, color: Colors.white)
        )

    ),
  ),
  SizedBox(height: 10,),

  TextField(
    controller: passwordController,
    obscureText: true,
    keyboardType: TextInputType.visiblePassword,
    decoration: InputDecoration(
        hintText: "Please Enter Your password",
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 2, color: Colors.white)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(width: 2, color: Colors.white)
        )

    ),
  ),
  SizedBox(height: 10,),
  ElevatedButton(onPressed: (){
    var email=emailController.text;
    var password= passwordController.text;
MyHelper().signIn(email, password, context);
  }, child:Text("Log in")),

  TextButton(onPressed: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SignupPage()));
  }, child: Text("I don't have account", style: TextStyle(color: Colors.white),))


],),

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_firebase_project1/helpers/myhelper.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),centerTitle: true,),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.blueAccent,
        child: Column(children: [
          TextField(
            controller: emailController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: Colors.white,
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
          ElevatedButton(onPressed: (){
            var email=emailController.text;
            var password= passwordController.text;
          MyHelper().signUp(email, password,context);
          }, child:Text("Sign Up")),
          SizedBox(height: 10,),



        ],),

      ),
    );
  }
}

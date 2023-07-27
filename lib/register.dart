import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController nameController= TextEditingController();
  TextEditingController ageController= TextEditingController();
  TextEditingController phoneController= TextEditingController();
  TextEditingController addressController= TextEditingController();

  CollectionReference users = FirebaseFirestore.instance.collection('register');

  Future<void> addUser() {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
      'name': nameController.text,
      'age': ageController.text,
      'phone': phoneController.text,
      'address': addressController.text
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register Data"),centerTitle: true,),
      body: Container(child: Column(
        children: [
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Please Enter Your naame",
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
            controller: ageController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Please Enter Your Age",
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
            controller: phoneController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Please Enter Your Phone Number",
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
            controller: addressController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                fillColor: Colors.white,
                hintText: "Please Enter Your Address",
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
               addUser();
          }, child: Text("Register"))
        ],
      ),),
    );
  }
}

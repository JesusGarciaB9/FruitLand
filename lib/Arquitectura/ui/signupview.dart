import 'package:flutter/material.dart';
import 'package:fruitland/Arquitectura/models/product.dart';
import 'package:http/http.dart' as http;
import './../components/widgetsbasicos.dart'; 
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import './../viewmodels/Shoplistmodel.dart';
class SignUp extends StatelessWidget {
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Signup"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19.3137085),
          child: Column(
            children: <Widget>[
              SizedBox(height: 32.3606798,),
              email(emailController),
<<<<<<< HEAD
=======
              Divider(),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
              password(passController),
             
              SizedBox(height:48.2842712),
              RaisedButton(
                onPressed: () async {

                  String passw = passController.text.trim();
                  String email = emailController.text.trim();
               var value = await signUp(email,passw);
             
                  Navigator.pop(context);
                },
<<<<<<< HEAD
=======
                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                child: Text('Crear Cuenta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
Future signUp(String email, String password) async {
  ShopListModel crear = new ShopListModel();
 
    try{
          FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)).user;
       
             print('Register succes in ${user.uid} ');
                await crear.create(user.uid,user.email);
             return user;
    }catch(e){
        print('Error: $e');
    }
 
}



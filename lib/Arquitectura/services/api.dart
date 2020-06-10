import 'dart:convert';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruitland/Arquitectura/models/product.dart';
import 'package:http/http.dart' as http;
import './../models/user.dart';
import './../viewmodels/Shoplistmodel.dart';

/// The service responsible for networking requests
class Api {
  static const String baseUrl = 'https://movil-api.herokuapp.com';

  var client = new http.Client();

 
  Future<FirebaseUser> getUserProfile({String email, String password}) async {
    try{
          FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password)).user;
             return user;
    }catch(e){
        print('Error: $e');
    }
  }

  
    Future<List<Product>> getProductos() async {
    Uri uri = Uri.https(
      "frutiland.herokuapp.com",
      '/search',
    );
    final http.Response response = await http.get(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    print(
        'show products ${response.statusCode}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      //return UserInfo.fromJson(json.decode(response.body));
      List<Product> productList = [];
      for (Map i in data) {
        //print('course $i');
        productList.add(Product.fromJson(i));
      }
      print('showproducts length ${productList.length}');
      return productList;
    } else {
      //Map<String, dynamic> body = json.decode(response.body);
      //String error = body['error'];
      //print('error  $error');
      return Future.error(response.statusCode.toString());
    }
  }

}

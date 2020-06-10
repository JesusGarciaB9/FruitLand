import 'dart:ffi';

import 'package:fruitland/Arquitectura/models/productList.dart';
import 'dart:convert';
import 'dart:io';
import './../services/productService.dart';
import '../base/basemodel.dart';
import '../locator.dart';
import './../models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './../services/authenticationservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './authprovider.dart';
class ShopListModel extends BaseModel {

  ProductListService _productos = locator<ProductListService>();
  List<Product> get productos => _productos.productos;
    List<Product> get listita => _productos.lista;
  List<Product>  mylist = [];
  String modificable = "abierta";
    AuthProvider _usersito = locator<AuthProvider>();
  String get username => _usersito.username;
    String get uid => _usersito.uid;
  
 
    Future getProducts(String email,String id) async {
    _productos.savelist([]);
    setState(ViewState.Busy);
    try {
      print("definimos user email $email");
      
      await _productos.getProductos();
      setState(ViewState.Idle);
      return Future.value(true);
    } catch (err) {
      print('mylistmodel getproducts ${err.toString()}');
       setState(ViewState.Idle);
      return Future.error(err.toString());
    } 
  }

  
  


  Future changecuantity(int index,int cantidad) async {
    mylist = listita;

    productos[index].cuantity = cantidad;
    mylist.add(productos[index]);
    _productos.savelist(mylist);
 
    notifyListeners();
  }


  Future saveList(List<Product> lista) async {
    print("${username}");
    print("${uid}");
      
    List<Map> list=new List();
    double total = 0;
      if(lista !=null && lista.isNotEmpty){
        lista.forEach((grp){
            total = total+grp.price.toDouble()*grp.cuantity;
            list.add(grp.toJson());
        });
    }
    lista.forEach((element) {
      print("producto  ${element.name}  con cantidad ${element.cuantity}");
    });
    Firestore.instance.collection('ShopList').document('$uid').setData({
      'list': FieldValue.arrayUnion(list), 
      'useremail':'$username',
      'estado':'abierta',
      'Total':'$total',
      'myId' :'$uid',
      'IdListas' :  FieldValue.arrayUnion([]), 
    }
                       
                      );


  }

  
  Future create(String superid,String supername) async {
    
    print("${superid}");
    print("${supername}");
       
    List<Map> list=new List();
    double total = 0;

    await Firestore.instance.collection('ShopList').document('$superid').setData({
      'list': FieldValue.arrayUnion(list), 
      'useremail':'$supername',
      'estado':'abierta',
      'Total':'$total',
      'myId' :'$superid',
      'IdListas' :  FieldValue.arrayUnion([]), 
    }
           );
    print("lo creó?");
  }
}
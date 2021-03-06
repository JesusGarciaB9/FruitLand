import 'package:fruitland/Arquitectura/viewmodels/Shoplistmodel.dart';
import 'package:fruitland/Arquitectura/viewmodels/vecinosmodel.dart';
import './../base/basemodel.dart';
import './../base/baseview.dart';
import './../viewmodels/authprovider.dart';
import './../viewmodels/homemodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './vecinosview.dart';
import './myshoplist.dart';
import './mylistview.dart';
 

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {  
    return  BaseView<HomeModel>(
     onModelReady: (model) => true,
    builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("HOME"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false)
                        .setLogOut();
                  },
                ),
              ],
            ),
            body: 
            Center(
              child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
            
                Spacer(),
                FlatButton(
                    child: Text('Product List',style: TextStyle(fontSize: 20.0)),
                    color: Theme.of(context).buttonColor,
                    textColor: Colors.white,
                    onPressed: () => toshopList(context,model.uid,model.username),
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    ),
                Divider(),
                FlatButton(
                    child: Text('My List',style: TextStyle(fontSize: 20.0)),
                    color: Theme.of(context).buttonColor,
                    textColor: Colors.white,
                    onPressed: () => tomyList(context,model.uid,model.username),
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    ),
                 Divider(),
                 FlatButton(
                    child: Text('My Neighbours',style: TextStyle(fontSize: 20.0)),
                    color: Theme.of(context).buttonColor,
                    textColor: Colors.white,
                    onPressed: () => vecinos(context,model.uid,model.username),
                    shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    ),
 
                Spacer(),
          ],
              )
           
            )));
  }
  void toshopList(BuildContext context,String uid,String email) async {
   
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => ShopList(myid:uid,email:email)),
    );
  }
  void tomyList(BuildContext context,String uid,String username) async {
  
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => MisProductos(myid:uid,username: username,)),
    );
  }
    void vecinos(BuildContext context,String uid,String username) async {
  
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => Vecinos(myid:uid,username: username,)),
    );
  }

 
}

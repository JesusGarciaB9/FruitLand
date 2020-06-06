
import './../base/basemodel.dart';
import './../base/baseview.dart';
import './../viewmodels/authprovider.dart';
import './../viewmodels/Shoplistmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../models/product.dart';
import 'package:collection/collection.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruitland/Arquitectura/models/productList.dart';
/*import 'package:f_202010_provider_get_it/architecture_example/models/course.dart';*/

class ShopList extends StatelessWidget {
  final String myid;
  final String email;
  StreamController<int> _events;
  ShopList({this.myid,this.email});
  @override
  Widget build(BuildContext context) {
    return BaseView<ShopListModel>(
        onModelReady: (model) => getData(context, model,email,myid),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Lista Productos"),
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
            body: model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: model.productos == null
                        ? Text('No data')
                        :  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Center(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                            ),
                            StreamBuilder(
               stream: Firestore.instance.collection('ShopList').document(myid).snapshots(),
              builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if(!snapshot.hasData){
                 print(snapshot.connectionState);
                }else{
                  if  (snapshot.data != null){
                 var data = snapshot.data.data;
                 if (data != null){
                 print("data $data");
                 UserList  usuarioL = new UserList.fromJson(snapshot.data.data);
                 print("user info ${usuarioL.abierta  }");
                 if (usuarioL.abierta == "abierta"){
                      return new FlatButton( 
                                child: Text('Guardar Lista de compras'),
                                onPressed:(){
                                     model.saveList(model.mylist);  
                                                               
                                 },
                           );
                 }else{
                       return new FlatButton( 
                                child: Text('Actualmente no puedes modificar la lista'),
                                onPressed:(){
                                     
                                                               
                                 },
                           );
                 }
                 }
              } }  return new FlatButton( 
                                child: Text('Guardar Lista de compras'),
                                onPressed:(){
                                     model.saveList(model.mylist);  
                                                               
                                 },
                           );             
               }
            ),
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                            ),
                          ],
                        )),
                        Container(
                          height: 350.0,
                          child: _list(model, context),
                        ),
                      ],
                    ),
                  )
 
                  )
                  )
                  );
  }






 
 
  void getData(BuildContext context, ShopListModel model,String email,String id) async {
   
    Function eq = const ListEquality().equals;
    if  (eq(model.productos,[])== true){
      print("entro");
    model
        .getProducts(email,id)
        .catchError((error) async {
      print("get Products got error: " + error);
      await _buildDialog(context, 'Alert', 'Need to login');
      Provider.of<AuthProvider>(context, listen: false).setLogOut();
    });
    }

  }

  void agregarcarrito(BuildContext context,Product element,ShopListModel model,int index) async {
   final cuantityController = TextEditingController();
   return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Seleccion el numero de productos'),
        content:  new Row(
          children: <Widget>[
            new Expanded(
              child: new TextField(
                controller: cuantityController,
                autofocus: true,
                decoration: new InputDecoration(
                    labelText: 'Seleccione el numero de ${element.name}.  ', hintText: ''),
              ),
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Guardar'),
            onPressed: () {
               int cantidad =  int.parse(cuantityController.text.trim());
               model.changecuantity(index,cantidad);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );


    /*Va desde 0 */

       
  }

  Widget _list(model, context) {
    return ListView.builder(
      itemCount: model.productos.length,
      itemBuilder: (context, posicion) {
        var element = model.productos[posicion];
        return _item(element, posicion, context,model);
      },
    );
  }

  Widget _item(Product element, int posicion, context,ShopListModel model) {
 
    return Dismissible(
      key: UniqueKey(),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        padding: EdgeInsets.all(20.0),
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  child:Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
                        child: Text(element.name), 
                      ),
                         Container(
                        margin: EdgeInsets.all(5),
                        child: Text("Precio :  "+element.price.toString()), 
                      ),
                           Container(
                        margin: EdgeInsets.all(5),
                        child: Text("cantidad: "+element.cuantity.toString()), 
                      )
                    ],
          
                  ),
                ),
 
                   FlatButton(
                    child: Text('Agregar al carrito'),
                    onPressed: () => agregarcarrito(context,element,model,posicion),
                  ),
                    FlatButton(
                    child: Text('eliminar'),
                    onPressed: () {}
                  ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _buildDialog(BuildContext context, _title, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(_title),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}

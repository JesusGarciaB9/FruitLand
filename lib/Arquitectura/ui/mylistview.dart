
import 'package:flutter/material.dart';
import 'package:fruitland/Arquitectura/models/product.dart';
import 'package:fruitland/Arquitectura/models/productList.dart';
import 'package:provider/provider.dart';
import './../viewmodels/mylistmodel.dart';
import './../base/baseview.dart';
import './../base/baseModel.dart';
import './../viewmodels/authprovider.dart';
import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MisProductos extends StatefulWidget {
  final String myid;
  final String username;
MisProductos({this.myid,this.username});

  @override
  _MisProductosState createState() => _MisProductosState();
}

class _MisProductosState extends State<MisProductos> {
  @override
  Widget build(BuildContext context) {
  return BaseView<MyListModel>(
        onModelReady: (model) => getdata(model,widget.myid,widget.username),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("My List <3"),
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
                    child: model.listavecinos == null && model.milista.useremail != null
                        ? Text('No data')
                        : 
                       Center(
                         
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      
                         Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),
                          ),
                        item(context,model),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                        Center(
                                child:Text("Listas añadidas"),                 
                       ),
                       Container(
                         height: 160,
                       child: listaadded(context,model),
                       ),
                  
                StreamBuilder(
               stream: Firestore.instance.collection('ShopList').document(model.milista.myid).snapshots(),
              builder: (BuildContext context,  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if(!snapshot.hasData){
                 print(snapshot.connectionState);
                }else{
                  if  (snapshot.data != null){
                 var data = snapshot.data.data;
                 if (data != null){
     
                 UserList  usuarioL = new UserList.fromJson(snapshot.data.data);
            
                 if (usuarioL.abierta == "abierta"){
                      return new FlatButton( 
                                child: Text('Cerrar'),
                                onPressed:(){
                                     cerrarandchange(context, model, model.milista.myid);
                                                               
                                 },
                           );
                 }else{
                       return new FlatButton( 
                                child: Text('Finalizar'),
                                onPressed:(){ 
                                                   finalize(context, model, model.milista.myid);               
                                 },
                           );
                 }
                 }
              } }  return new FlatButton( 
                                child: Text('Cerrar'),
                                onPressed:(){
                                             cerrarandchange(context, model, model.milista.myid); 
                                                               
                                 },
                           );             
               }
            ),
                       
                    ],
                  ) 
                  
                  ),
                        
                          )
                          )
                          );
  }
  void getdata(MyListModel model ,String id,String mail) async{
    print("mi ide ${widget.myid}");
     model.getMyList(widget.myid,widget.username);
  }
  void cerrarandchange(context,MyListModel model,String id )async{
      print("entro a cerrar and change $id  ");
      bool ab = await model.closemylist(id);

   
  }
  void finalize(context,MyListModel model,String id) async{
      bool c = await model.finalize(id);
  
  }

  Widget listaadded(context,MyListModel model){
 
         if  (model.listavecinos.length != 0){
      print("entro ${model.listavecinos.length}");
     return Center(
       
    child:  ListView.builder(
      shrinkWrap: true,
 
      itemCount: model.listavecinos.length,
      itemBuilder: (context, posicion) {
        
        var element = model.listavecinos[posicion];
        
        return itemusuariolista(element, posicion, context,model);
      },
    )
    );
  }
  }

  Widget itemusuariolista(UserList element,int posicion,context,MyListModel model){
 return Dismissible(
      key: UniqueKey(),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        padding: EdgeInsets.all(20.0),
        color: Theme.of(context).backgroundColor,
        child: Column(

          children: <Widget>[
 
                Center(
                  child:Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
             
                        child: Text("  shoping List"), 
                      ),
                        Center(
          
                        child: Text("Username :  ${element.useremail}" ), 
                      ),
                           Container(
                          height: 62.0,
                         
                            child:listaproducto(model, context,element),
                        ),
                        Center(
                   
                        child: Text("Total : ${element.total}"), 
                      )
                    ],
          
                  ),
                ),
          ],
        ),
      ),
    );
  }

   Widget item( context,MyListModel model) {
 
    return Dismissible(
      key: UniqueKey(),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        padding: EdgeInsets.all(20.0),
        color: Theme.of(context).backgroundColor,
        child: Column(

          children: <Widget>[
 
                Center(
                  child:Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Center(
             
                        child: Text("My shoping List"), 
                      ),
                        Center(
          
                        child: Text("Username :  ${model.milista.useremail}" ), 
                      ),
                        Container(
                          height: 62.0,
                         
                            child:_list(model, context),
                        ),
                        Center(
                   
                        child: Text("Total : ${model.milista.total}"), 
                      )
                    ],
          
                  ),
                ),
          ],
        ),
      ),
    );
  }

  Widget _list(MyListModel model, context) {
      Function eq = const ListEquality().equals;
    
         if(model.milista.productos != null){
         if  (model.milista.productos.length != 0){
     return Center(
       
    child:  ListView.builder(
      shrinkWrap: true,
 
      itemCount: model.milista.productos.length,
      itemBuilder: (context, posicion) {
        
        var element = model.milista.productos[posicion];
        
        return _item(element, posicion, context,model);
      },
    )
    );
  }}}

    Widget _item(Product element, int posicion, context,MyListModel model) {
 
    return Dismissible(
      key: UniqueKey(),
      child:
                Center(
                  
                  child: Column(
                     
                     children: <Widget>[
                     
                       Container(
                          decoration: new BoxDecoration(color: Colors.green),
                        child:Center(
                        
                        child: Text("Nombre Producto :  "+element.name), 
                      ),),
                       Container(
                         
                          decoration: new BoxDecoration(color: Colors.blue),
                       
                          alignment: Alignment.center,
                         child: Row(

                           mainAxisAlignment: MainAxisAlignment.center ,//Center Row contents horizontally,
                          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                          children: <Widget>[
                            Center(
                        
                        child: Text("Precio : ${element.price.toString()}    "), 
                      ),
                
                            Center(
             
                        child: Text("cantidad: ${element.cuantity.toString()}"),  
                      ),

                          ],
                         ),
                       ),
                     
                   
              
                     ]
                  )
                  ));
                


  }

  listaproducto(MyListModel model,context,UserList elementito) {
      
         if  (elementito.productos.length != 0){
     return Center(
       
    child:  ListView.builder(
      shrinkWrap: true,
 
      itemCount: elementito.productos.length,
      itemBuilder: (context, posicion) {
        
        var element = elementito.productos[posicion];
        
        return _item(element, posicion, context,model);
      },
    )
    );
  }}
}


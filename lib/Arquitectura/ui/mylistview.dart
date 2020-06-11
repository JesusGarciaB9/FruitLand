
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
<<<<<<< HEAD
                                child:Text("Listas añadidas"),                 
=======
                                child:Text("Listas añadidas",style: TextStyle(fontSize: 20.0)),                 
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
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
<<<<<<< HEAD
                                child: Text('Cerrar'),
=======
                                child: Text('Cerrar',style: TextStyle(fontSize: 20.0)),
                                color: Theme.of(context).buttonColor,
                                textColor: Colors.white,
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                                onPressed:(){
                                     cerrarandchange(context, model, model.milista.myid);
                                                               
                                 },
<<<<<<< HEAD
                           );
                 }else{
                       return new FlatButton( 
                                child: Text('Finalizar'),
                                onPressed:(){ 
                                                   finalize(context, model, model.milista.myid);               
                                 },
=======
                                 shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                           );
                 }else{
                       return new FlatButton( 
                                child: Text('Finalizar',style: TextStyle(fontSize: 20.0)),
                                color: Theme.of(context).buttonColor,
                                textColor: Colors.white,
                                onPressed:(){ 
                                                   finalize(context, model, model.milista.myid);               
                                 },
                                 shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                           );
                 }
                 }
              } }  return new FlatButton( 
<<<<<<< HEAD
                                child: Text('Cerrar'),
=======
                                child: Text('Cerrar',style: TextStyle(fontSize: 20.0)),
                                color: Theme.of(context).buttonColor,
                                textColor: Colors.white,
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                                onPressed:(){
                                             cerrarandchange(context, model, model.milista.myid); 
                                                               
                                 },
<<<<<<< HEAD
=======
                                 shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
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
             
<<<<<<< HEAD
                        child: Text("  shoping List"), 
                      ),
                        Center(
          
                        child: Text("Username :  ${element.useremail}" ), 
                      ),
                           Container(
                          height: 62.0,
=======
                        child: Text("  shoping List",style: TextStyle(fontSize: 20.0)), 
                      ),
                        Center(
          
                        child: Text("Username :  ${element.useremail}",style: TextStyle(fontSize: 18.0) ), 
                      ),
                           Container(
                          height: 100.0,
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                         
                            child:listaproducto(model, context,element),
                        ),
                        Center(
                   
<<<<<<< HEAD
                        child: Text("Total : ${element.total}"), 
=======
                        child: Text("Total : ${element.total}",style: TextStyle(fontSize: 18.0)), 
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
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
<<<<<<< HEAD
             
                        child: Text("My shoping List"), 
                      ),
                        Center(
          
                        child: Text("Username :  ${model.milista.useremail}" ), 
                      ),
                        Container(
                          height: 62.0,
=======
                       
                        child: Text("My shoping List",style: TextStyle(fontSize: 20.0)),
                      ),
                        Center(
          
                        child: Text("Username :  ${model.milista.useremail}",style: TextStyle(fontSize: 18.0) ), 
                      ),
                        Container(
                          height: 100.0,
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                         
                            child:_list(model, context),
                        ),
                        Center(
                   
<<<<<<< HEAD
                        child: Text("Total : ${model.milista.total}"), 
=======
                        child: Text("Total : ${model.milista.total}",style: TextStyle(fontSize: 18.0)), 
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
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
<<<<<<< HEAD
                     
                     children: <Widget>[
                     
                       Container(
                          decoration: new BoxDecoration(color: Colors.green),
                        child:Center(
                        
                        child: Text("Nombre Producto :  "+element.name), 
                      ),),
                       Container(
                         
                          decoration: new BoxDecoration(color: Colors.blue),
=======
                     //shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                     children: <Widget>[
                     
                       Container(
                          decoration: new BoxDecoration(color: Colors.orange, border: Border.all(width: 3.0)),
                        child:Center(
                        
                        child: Text("Nombre Producto :  "+element.name,style: TextStyle(fontSize: 18.0)), 
                      ),
                      
                      ),
                      
                       Container(
                         
                          decoration: new BoxDecoration(color: Colors.grey),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                       
                          alignment: Alignment.center,
                         child: Row(

                           mainAxisAlignment: MainAxisAlignment.center ,//Center Row contents horizontally,
                          crossAxisAlignment: CrossAxisAlignment.center, //Center Row contents vertically,
                          children: <Widget>[
                            Center(
                        
<<<<<<< HEAD
                        child: Text("Precio : ${element.price.toString()}    "), 
=======
                        child: Text("Precio : ${element.price.toString()}    ",style: TextStyle(fontSize: 18.0)), 
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                      ),
                
                            Center(
             
<<<<<<< HEAD
                        child: Text("cantidad: ${element.cuantity.toString()}"),  
=======
                        child: Text("cantidad: ${element.cuantity.toString()}",style: TextStyle(fontSize: 18.0)),  
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                      ),

                          ],
                         ),
                       ),
                     
<<<<<<< HEAD
                   
              
=======
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
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


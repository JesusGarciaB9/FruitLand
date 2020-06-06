
import 'package:flutter/material.dart';
import 'package:fruitland/Arquitectura/models/product.dart';
import 'package:fruitland/Arquitectura/models/productList.dart';
import 'package:provider/provider.dart';
import './../viewmodels/mylistmodel.dart';
import './../base/baseview.dart';
import './../base/baseModel.dart';
import './../viewmodels/authprovider.dart';
import 'package:collection/collection.dart';

class MisProductos extends StatelessWidget {
  final String myid;
  final String username;
MisProductos({this.myid,this.username});
  @override
  Widget build(BuildContext context) {
  return BaseView<MyListModel>(
        onModelReady: (model) => model.getMyList(myid,username),
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
                    child: model.uid == null
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
                       Container(
                                    child: FlatButton(
                                      color:Colors.blue,
                          child: Text("Cerrar con ${model.totalfinal.toString()} pesos "),
                          onPressed: () => {})               
                       ),
                    ],
                  ) 
                  
                  ),
                        
                          )
                          )
                          );
  }
  Widget listaadded(context,MyListModel model){
 
         if  (model.listas != null){
      print("entro ${model.listas.length}");
     return Center(
       
    child:  ListView.builder(
      shrinkWrap: true,
 
      itemCount: model.listas.length,
      itemBuilder: (context, posicion) {
        
        var element = model.listas[posicion];
            print("entro2");
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
          
                        child: Text("Username :  ${model.myuser.useremail}" ), 
                      ),
                        Container(
                          height: 62.0,
                         
                            child:_list(model, context),
                        ),
                        Center(
                   
                        child: Text("Total : ${model.myuser.total}"), 
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
    
 
         if  (model.myuser.productos!=null){
     return Center(
       
    child:  ListView.builder(
      shrinkWrap: true,
 
      itemCount: model.myuser.productos.length,
      itemBuilder: (context, posicion) {
        
        var element = model.myuser.productos[posicion];
        
        return _item(element, posicion, context,model);
      },
    )
    );
  }}
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
  listaproducto(MyListModel model,context,UserList elementito){
      
         if  (elementito.productos!=null){
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


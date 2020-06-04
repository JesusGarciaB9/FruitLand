
import 'package:flutter/material.dart';
import 'package:fruitland/Arquitectura/models/productList.dart';
import 'package:provider/provider.dart';
import './../viewmodels/mylistmodel.dart';
import './../base/baseview.dart';
import './../base/baseModel.dart';
import './../viewmodels/authprovider.dart';
import './../viewmodels/vecinosmodel.dart';


class Vecinos extends StatelessWidget {
  final String myid;
  final String username;
Vecinos({this.myid,this.username});
  @override
  Widget build(BuildContext context) {
  return BaseView<Vecinosmodel>(
        onModelReady: (model) => model.getvecinosList(myid,username),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("Neighbours"),
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
                        :  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Center(
                          child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 20, bottom: 10),
                            ),
                              Container(
                          height: 350.0,
                          child: _list(model, context),
                        ),
                            ],
                            ),
                            ),
                      ],
                        ),
                )
                          )
                          );
  }

    Widget _list(model, context) {
    return ListView.builder(
      itemCount: model.listas.length,
      itemBuilder: (context, posicion) {
        var element = model.listas[posicion];
        print("element ${element}");
        return _item(element, posicion, context,model);
      },
    );
  }

  Widget _item(UserList element, int posicion, context,Vecinosmodel model) {
 
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
                        child: Text("Usuario : ${element.useremail}"), 
                      ),
                         Container(
                        margin: EdgeInsets.all(5),
                        child: Text("Total compra : ${element.total.toString()} " ), 
                      ),
                  
                    ],
          
                  ),
                ),
      Container(
                  child:Column(
                    children: <Widget>[
                          FlatButton(
                    child: Text('Ayudar vecino'),
                    onPressed: () {}
                  ),
                    FlatButton(
                    child: Text('Ver detalles'),
                    onPressed: () {}
                  ),
                    ],
          
                  ),
                ),
       
 
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
  }

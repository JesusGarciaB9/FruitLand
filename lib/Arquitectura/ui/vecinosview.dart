import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:fruitland/Arquitectura/models/productList.dart';
import 'package:provider/provider.dart';
import './../viewmodels/mylistmodel.dart';
import './../base/baseview.dart';
import './../base/baseModel.dart';
import './../viewmodels/authprovider.dart';
import './../viewmodels/vecinosmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Vecinos extends StatefulWidget {
  final String myid;
  final String username;

  Vecinos({this.myid, this.username});

  @override
  _VecinosState createState() => _VecinosState();
}

class _VecinosState extends State<Vecinos> {
  List<bool> pertenecea = new List<bool>();
  @override
  Widget build(BuildContext context) {
    return BaseView<Vecinosmodel>(
        onModelReady: (model) =>
            getData(context, model, widget.username, widget.myid),
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
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Center(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    Container(
                                      padding:
                                          EdgeInsets.only(top: 20, bottom: 10),
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
                  )));
  }

  void getData(
      BuildContext context, Vecinosmodel model, String email, String id) async {
    Function eq = const ListEquality().equals;

    model.getvecinosList(id, email).catchError((error) async {});
  }

  Widget _list(Vecinosmodel model, context) {
    return ListView.builder(
      itemCount: model.listas.length,
      itemBuilder: (context, posicion) {
        var element = model.listas[posicion];
        if (element.pertenecea == "") {
<<<<<<< HEAD
=======
          print("entrooooooo yi");
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
          pertenecea.add(false);
        } else {
          pertenecea.add(true);
        }

        return _item2(element, posicion, context, model, pertenecea);
      },
    );
  }

  Widget _item2(UserList element, int posicion, context, Vecinosmodel model,
      List<bool> pertenecea) {
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
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(5),
<<<<<<< HEAD
                        child: Text("Usuario : ${element.useremail}"),
=======
                        child: Text("Usuario : ${element.useremail}",style: TextStyle(fontSize: 16.0)),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child:
<<<<<<< HEAD
                            Text("Total compra : ${element.total.toString()} "),
=======
                            Text("Total compra : ${element.total.toString()} ",style: TextStyle(fontSize: 16.0)),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                      ),
                    ],
                  ),
                ),
<<<<<<< HEAD
=======
                Spacer(),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                Container(
                  child: Column(
                    children: <Widget>[
                      FlatButton(
                          child: Text(pertenecea[posicion] == false
                              ? 'Ayudar'
<<<<<<< HEAD
                              : 'Borrar'),
=======
                              : 'Borrar',style: TextStyle(fontSize: 16.0)),
                              color: Theme.of(context).buttonColor,
                                textColor: Colors.white,
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                          onPressed: () => {
                                pertenecea[posicion] == false
                                    ? {
                                        ayudar(
                                            context,
                                            widget.myid,
                                            element.myid,
                                            model,
                                            pertenecea,
                                            posicion)
                                      }
                                    :  {
                                        borrar(
                                            context,
                                            widget.myid,
                                            element.myid,
                                            model,
                                            pertenecea,
                                            posicion)
                                      }
                                     
<<<<<<< HEAD
                              }),
                      FlatButton(child: Text('Ver detalles'), onPressed: () {}),
=======
                              },
                              shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              ),
                      FlatButton(child: Text('Ver detalles',style: TextStyle(fontSize: 16.0)), 
                      color: Theme.of(context).buttonColor,
                      textColor: Colors.white,
                      onPressed: () {},
                      shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      ),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
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

  void ayudar(BuildContext context, String id, String idvecino,
      Vecinosmodel model, List<bool> pertenecea, int posicion) async {
    print("se hizo click con id vecino ${idvecino}");
    model.addlist2(id, idvecino,id);
    setState(() {
      print("se actualizo");
      pertenecea[posicion] = true;
    });
  }
    void borrar(BuildContext context, String id, String idvecino,
    Vecinosmodel model, List<bool> pertenecea, int posicion) async {
    print("se hizo click con id vecino ${idvecino}");
    model.addlist2(id, idvecino,"");
    setState(() {
      print("se actualizo");
      pertenecea[posicion] = false;
    });
  }
}

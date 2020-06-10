import 'package:fruitland/Arquitectura/models/product.dart';

import './../models/productList.dart';
import './../base/basemodel.dart';
import './../services/api.dart';
import './../locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './../services/listservice.dart';
class MyListModel extends BaseModel {
  Api _api = locator<Api>();
  String uid;
  String username;
  ListService usuariosylista = locator<ListService>();
  List<UserList> get listavecinos => usuariosylista.listavecinos;
  UserList get milista => usuariosylista.milista;
  double get totaltemp => usuariosylista.totaltemp;
  
  Future getMyList(String id, String user) async {
    
    setState(ViewState.Busy);
    uid = id;
    username = user;
   await usuariosylista.instanciacion(id);
    setState(ViewState.Idle);
    notifyListeners();
   return Future.value(true);
  }

  
  Future closemylist(String id) async{
 
  Firestore.instance.collection('ShopList').document('$id').updateData({
    'estado': "cerrada",
  });
  return Future.value(true);
}


  Future finalize(String id) async{
        setState(ViewState.Busy);
      await usuariosylista.finalize(id);
      print("terminará finalize");
     setState(ViewState.Idle);
    notifyListeners();
  return Future.value(true);
}
}


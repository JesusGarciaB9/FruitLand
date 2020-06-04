import './../base/basemodel.dart';
import './../models/user.dart';
import './../services/authenticationservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './../services/api.dart';
import '../locator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './authprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './../models/productList.dart';

class Vecinosmodel extends BaseModel {
  Api _api = locator<Api>();
  String uid;
  String username;
  List<UserList> listas = [];

  Future getvecinosList(String id, String user) async {
    setState(ViewState.Busy);
    uid = id;
    username = user;
/*.where('pacienteUid', isEqualTo: widget.user.uid)*/
    QuerySnapshot qShot =
        await Firestore.instance.collection('ShopList').getDocuments();

    List<UserList> a =
        qShot.documents.map((doc) => new UserList.fromJson(doc.data)).toList();

    for (var item in a) {
      print("item ");
      if (item.abierta == "cerrada" && item.myid != id) {
        print("entro");
        listas.add(item);
      }
    }

    setState(ViewState.Idle);
    return Future.value(true);
  }
}

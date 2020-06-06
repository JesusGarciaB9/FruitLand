import 'package:fruitland/Arquitectura/models/user.dart';
import './productService.dart';
import './../models/productList.dart';
import './../models/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../locator.dart';
import 'api.dart';

class ListService {
  Api _api = locator<Api>();

  List<UserList> _userlist = [];
  UserList _user = new UserList();
  List<UserList> get listavecinos => _userlist;
  UserList get milista => _user;
  ProductListService _reset =  locator<ProductListService>();
  double _totaltemp = 0;
  double get totaltemp => _totaltemp;

  Future instanciacion(String id) async {
    _userlist = [];
    QuerySnapshot qShot =
        await Firestore.instance.collection('ShopList').getDocuments();
    List<UserList> a =
        qShot.documents.map((doc) => new UserList.fromJson(doc.data)).toList();

    for (var item in a) {
      _totaltemp = _totaltemp + item.total;
      if (item.myid == id) {
        _user = item;
      } else if (item.pertenecea == id) {
        _userlist.add(item);
      }
    }
    
  }

  close(String id) async {}

  finalize(String id) async {
    print("entro a finalize");
    _userlist = [];
    _totaltemp = 0;
    double totali = 0;
    List<Map> newlist =  new List<Map>();

    _reset.reset();
    QuerySnapshot qShot =
        await Firestore.instance.collection('ShopList').getDocuments();
    List<UserList> a =
        qShot.documents.map((doc) => new UserList.fromJson(doc.data)).toList();

    for (var item in a) {
      if (item.myid == id) {
      await  Firestore.instance.collection('ShopList').document('$id').setData({
      'estado': "abierta",
      'Total': '$totali',
      'list': FieldValue.arrayUnion(newlist),
      'myId':'$id',
      'pertenecea':"",
      'useremail':"${item.useremail}",
    });
      } else if (item.pertenecea == id) {
      await Firestore.instance.collection('ShopList').document('${item.myid}').setData({
      'estado': "abierta",
      'Total': '$totali',
      'list': FieldValue.arrayUnion(newlist),
      'myId':'${item.myid}',
      'pertenecea':"",
      'useremail':"${item.useremail}",
    });
      }
    }
   await instanciacion(id);
  }
 
}

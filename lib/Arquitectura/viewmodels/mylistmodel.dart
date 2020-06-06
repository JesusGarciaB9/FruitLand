import './../models/productList.dart';
import './../base/basemodel.dart';
import './../services/api.dart';
import './../locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MyListModel extends BaseModel {
  Api _api = locator<Api>();
  String uid;
  String username;
  List<UserList> listas = [];
  UserList myuser = new UserList() ;
  double totalfinal  ;

    Future getMyList(String id,String user) async {
     double totaltemp = 0;
  setState(ViewState.Busy);
    uid = id;
    username = user;
    print("username $id");
        QuerySnapshot qShot =
        await Firestore.instance.collection('ShopList').getDocuments();
    List<UserList> a =
        qShot.documents.map((doc) => new UserList.fromJson(doc.data)).toList();

    for (var item in a) {
                   totaltemp = totaltemp + item.total;
          if  (item.myid == id){
               myuser = item;
          }else if(item.pertenecea == id){
            print("añadio");
          listas.add(item);
          }      
    }
    totalfinal = totaltemp;
  setState(ViewState.Idle);
  }
}

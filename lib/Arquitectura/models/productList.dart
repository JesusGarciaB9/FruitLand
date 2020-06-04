import './product.dart';

class UserList {
  final List<Product> productos;
  final String useremail;
  final String abierta;
  final double total;
  final List<String> idlists;
  final String myid;
  UserList({this.productos,this.useremail,this.abierta,this.total,this.myid,this.idlists,});

  UserList.initial()
      : useremail = "",
        abierta ="",
        total = 0,
        idlists = [],
        myid = "",
        productos = [];

 factory UserList.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
     List<String> list2 = json['idlist'] as List;
    List<Product> product = list.map((i) => Product.fromJson(i)).toList();
      return UserList( 
      productos : product,
      useremail: json['useremail'],
      abierta:json['estado'],
      total:double.parse(json['Total']),
      idlists: list2,
      myid : json['myId'],
    );
  }
}
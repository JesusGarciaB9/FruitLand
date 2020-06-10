import './product.dart';

class UserList {
  final List<Product> productos;
  final String useremail;
  final String abierta;
  final double total;
 
  final String myid;
  final String pertenecea;
  UserList({this.productos,this.useremail,this.abierta,this.total,this.myid ,this.pertenecea});

  UserList.initial( )
      : useremail = "",
        abierta ="",
        total = 0,
        myid = "",
        pertenecea = "",
        productos =  [];
        

 factory UserList.fromJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
 
    List<Product> product = list.map((i) => Product.fromJson2(i)).toList();
      return UserList( 
      productos : product,
      useremail: json['useremail'],
      abierta:json['estado'],
      total:double.parse(json['Total']),
      pertenecea: json['pertenecea'],
 
      myid : json['myId'],
    );
  }
}
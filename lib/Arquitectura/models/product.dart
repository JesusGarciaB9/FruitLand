

import 'dart:ui';

class Product {
  final int id;
  final String name;
   int cuantity;
  final double price;
 
 
  Product({this.id, this.name, this.price,this.cuantity});
    Product.initial()
      : id = 0,
        name = '',
        cuantity = 0,
        price = 0;

        

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      cuantity: 0,
    );
  }
    factory Product.fromJson2(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      cuantity: json['cuantity'],
    );
  }
    Map<String, dynamic> toJson() =>
    {
      'name': name,
      'price': price,
      'cuantity':cuantity
    };
   
}

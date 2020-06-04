import './../models/productList.dart';
import './../models/product.dart';

import '../locator.dart';
import 'api.dart';

class ProductListService {
  Api _api = locator<Api>();
 
  List<Product> _productos = [];
  List<Product> _list = [];
  List<Product> get productos => _productos;
  List<Product> get lista => _list;
  String id = "";
  Future getProductos() async {
    try {
      _productos = await _api.getProductos();
    } catch (err) {
      print('service getproductos ${err.toString()}');
      return Future.error(err.toString());
    }
  }
  Future savelist(listauser ) async {

      _list = listauser;
  }
   
 Future reset(){
   _productos =[];
   _list =[];
 }
}
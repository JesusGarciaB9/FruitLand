
import 'package:get_it/get_it.dart';
import './services/authenticationservice.dart';
import './services/productService.dart';
import './viewmodels/Shoplistmodel.dart';
import './viewmodels/loginmodel.dart';
import './viewmodels/homemodel.dart';
import './viewmodels/authprovider.dart';
import 'services/api.dart';
import './viewmodels/mylistmodel.dart';
import './viewmodels/vecinosmodel.dart';
import './services/listservice.dart';
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => ProductListService());
    locator.registerLazySingleton(() => ListService());
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => ShopListModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => AuthProvider());
  locator.registerFactory(() => MyListModel());
  locator.registerFactory(() => Vecinosmodel());
  
  

}

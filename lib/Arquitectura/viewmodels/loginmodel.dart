import './../base/basemodel.dart';
import './../models/user.dart';
import './../services/authenticationservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './../services/api.dart';
import '../locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  FirebaseUser get user => _authenticationService.user;
   Api _api = locator<Api>();
 
  Future<bool> login(String email,String pass) async {
    print("llego a primera funcion de login");
    setState(ViewState.Busy);
    var success = await _authenticationService.login(email, pass);
    notifyListeners();
    setState(ViewState.Idle);
    return success;
  }

}

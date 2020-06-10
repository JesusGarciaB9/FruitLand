import 'dart:async';
import './../models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../locator.dart';
import 'api.dart';


class AuthenticationService {
  Api _api = locator<Api>();
  FirebaseUser user;
  
 // StreamController<User> userController = StreamController<User>();



  Future<bool> login(String email, String password) async {
    FirebaseUser fetchedUser = await _api.getUserProfile(email: email, password: password);
    var hasUser = fetchedUser != null;
    if(hasUser) {
      user = fetchedUser;
    }
    return hasUser;
  }
    Future<bool> logout() async {
    return Future.value(true);
  }

}
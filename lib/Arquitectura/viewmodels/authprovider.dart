import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './../services/productService.dart';
import './../locator.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
    _read();
  }
  String _username;
  String _uid;
  bool _loggedIn = false;
  bool _userCreated = false;
  ProductListService _reset =  locator<ProductListService>();
  get username => _username;
  get userCreated => _userCreated;
  get loggedIn => _loggedIn;
  get uid => _uid;


  void setLoggedIn(String userName,String id) {
    _uid = id;
    _username = userName;
    _loggedIn = true;
    _save();
    notifyListeners();
  }

  void setLogOut() {
    _loggedIn = false;
    _reset.reset();
    _save();
    notifyListeners();
  }

  void setUserCreated(bool state) {
    _userCreated = state;
    notifyListeners();
  }

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    final v = prefs.getBool('my_int_key') ?? false;
    final i = prefs.getString('my_uid') ?? "_";
    final x = prefs.getString('my_username') ?? "_";
    if (v != null) {
      _loggedIn = v;
      _username = x;
      _uid = i;
      notifyListeners();
    }
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('my_int_key', _loggedIn);
    prefs.setString('my_username', _username);
     prefs.setString('my_uid', _uid);
  }
}


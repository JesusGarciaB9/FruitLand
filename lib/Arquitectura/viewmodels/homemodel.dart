import './../base/basemodel.dart';
import './../models/user.dart';
import './../services/authenticationservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './../services/api.dart';
import '../locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './authprovider.dart';
import './../models/product.dart';
class HomeModel extends BaseModel {
 final AuthProvider _user = locator<AuthProvider>();
  String get username => _user.username;
  String get uid => _user.uid;
  String awa;


}


import './../base/basemodel.dart';
import './../services/api.dart';
import './../locator.dart';

class MyListModel extends BaseModel {
  Api _api = locator<Api>();
  String uid;
  String username;
  

    Future getMyList(String id,String user) async {
    uid = id;
    username = user;
    print("username $id");

  }
}

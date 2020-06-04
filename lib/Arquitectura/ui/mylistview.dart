
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../viewmodels/mylistmodel.dart';
import './../base/baseview.dart';
import './../base/baseModel.dart';
import './../viewmodels/authprovider.dart';


class MisProductos extends StatelessWidget {
  final String myid;
  final String username;
MisProductos({this.myid,this.username});
  @override
  Widget build(BuildContext context) {
  return BaseView<MyListModel>(
        onModelReady: (model) => model.getMyList(myid,username),
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
              title: Text("My List <3"),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.exit_to_app),
                  onPressed: () {
                    Provider.of<AuthProvider>(context, listen: false)
                        .setLogOut();
                  },
                ),
              ],
            ),
  
            body: model.state == ViewState.Busy
                ? Center(child: CircularProgressIndicator())
                : Center(
                    child: model.uid == null
                        ? Text('No data')
                        : 
                       Center(   
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      
                         Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),
                          ),
                          item(context,model),
                       Container(
                                padding: EdgeInsets.only( top: 20,bottom: 10),                 
                       ),
                    
                             
                    ],
                  ) 
                  
                  ),
                        
                          )
                          )
                          );
  }

   Widget item( context,MyListModel model) {
 
    return Dismissible(
      key: UniqueKey(),
      child: Container(
        margin: EdgeInsets.only(bottom: 8.0),
        padding: EdgeInsets.all(20.0),
        color: Theme.of(context).backgroundColor,
        child: Column(
          children: <Widget>[
 
                Center(
                  child:Column(
                    children: <Widget>[
                      Center(
             
                        child: Text("My shoping List"), 
                      ),
                        Center(
          
                        child: Text("Username :  ${model.username}" ), 
                      ),
                        Center(
                   
                        child: Text("cantidad: "), 
                      )
                    ],
          
                  ),
                ),
          ],
        ),
      ),
    );
  }

}

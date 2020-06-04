import 'package:fruitland/Arquitectura/viewmodels/Shoplistmodel.dart';

import './Arquitectura/ui/homeview.dart';
import './Arquitectura/ui/loginview.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './Arquitectura/ui/myshoplist.dart';
import './Arquitectura/locator.dart';
 
import './Arquitectura/viewmodels/authprovider.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthProvider>(
        create: (context) => AuthProvider(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ProviderGeit',
          theme: ThemeData(
            primarySwatch: Colors.red,
            brightness: Brightness.dark,
            buttonColor: Colors.deepOrange,
          ),
          home: Central(),
        ));
  }
}


class Central extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildUi();
  }

Widget _buildUi() {
    return Container(child: Consumer<AuthProvider>(//                  <--- Consumer
        builder: (context, authProvider, child) {
      print("AuthProvider logged ${authProvider.loggedIn}");
      if (authProvider.loggedIn) {
        
        return Home();
      } else {
        return LoginView();
      }
    }));
  }
}


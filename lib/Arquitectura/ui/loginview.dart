import './../base/basemodel.dart';
import './../base/baseview.dart';
import './../viewmodels/authprovider.dart';
import './../viewmodels/loginmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './../components/widgetsbasicos.dart';
import 'signupview.dart';

class LoginView extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginModel>(
        builder: (context, model, child) => Scaffold(
            body:
                // Provider.of<User>(context, listen: false).logged == true ?  CourseListView() :
                model.state == ViewState.Busy
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                      padding: const EdgeInsets.all(12.944),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).accentColor),
                              height: 30,
                              width: 50,
                            ),
                            SizedBox(
<<<<<<< HEAD
                              height: 10,
                            ),
                            email(emailController),
=======
                              height: 50,
                            ),
                            email(emailController),
                            Divider(),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                            password(passController),
                            SizedBox(
                              height: 40,
                            ),
                            Container(
                              width: double.infinity,
                              child: FlatButton(
                                child: Text("Ingresar "),
                                color: Theme.of(context).buttonColor,
                                textColor: Colors.white,
                                onPressed: () async {
                                  final String email =
                                      emailController.text.trim();
                                  final String password =
                                      passController.text.trim();

                                  //Calling the method from provider.
                                  var loginSuccess =
                                      await model.login(email, password);
                                  if (loginSuccess) {
                                    print(
                                        'LoginView loginSuccess setting up setLoggedIn ');
                                    Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .setLoggedIn(model.user.email,model.user.uid);
                                  }
                                },
<<<<<<< HEAD
=======
                                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              width: double.infinity,
                              child: FlatButton(
                                child: Text("¿No tienes una cuenta? crea una"),
                                color: Theme.of(context).buttonColor,
                                textColor: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUp()),
                                  );
                                },
<<<<<<< HEAD
=======
                                shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
>>>>>>> 41a46c53bab3dbee907606856d18d7fcea5194f8
                              ),
                            ),
                          ],
                        ),
                    )));
  }

  Future<void> _buildDialog(BuildContext context, _title, _message) {
    return showDialog(
      builder: (context) {
        return AlertDialog(
          title: Text(_title),
          content: Text(_message),
          actions: <Widget>[
            FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                })
          ],
        );
      },
      context: context,
    );
  }
}

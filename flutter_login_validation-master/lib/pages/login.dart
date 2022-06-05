import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_validation/pages/fontstyle.dart';
import 'package:login_validation/pages/registrasi.dart';
import '../header/header.dart';
import 'homepage.dart';

void main() => runApp(LoginPage());

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String _username = "admin", _password = "admin";
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

  final _globaKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globaKey,
        child: Column(
          children: <Widget>[
            Header(),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    "Username",
                    style: forText,
                  ),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                maxLength: 20,
                maxLengthEnforced: true,
                controller: myUsernameController,
                validator: (String value) {
                  if (value.isEmpty) {
                     return 'Please Input Username' ;
                  }
                  return null;

                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  hintText: "Masukkan Username",
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: Row(
                children: <Widget>[
                  Text(
                    "Password",
                    style: forText,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                maxLength: 20,
                maxLengthEnforced: true,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please Input Password' ;
                  }
                  return null;
                  },
                controller: myPasswordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent)),
                  hintText: "Masukkan Password",
                ),
              ),
            ),
            SizedBox(height: 30),
            ButtonTheme(
                minWidth: 125,
                height: 50,
                splashColor: Colors.lightBlueAccent,
                child: MaterialButton(
                  color: Color(0xff3282B8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  // ignore: missing_return
                  onPressed: () {
                    _username = myUsernameController.text;
                    _password = myPasswordController.text;
                    if (_globaKey.currentState.validate()) {
                      if (_username != 'admin') {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Column(
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage('assets/images/salah.png'),
                                      height: 100,
                                      width: 100,
                                    ),
                                    SizedBox(height: 10),
                                    Text("USERNAME SALAH !!", textAlign: TextAlign.center, style: alertLogin,),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              );
                            });
                      } else if (_password != 'admin') {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Column(
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage('assets/images/salah.png'),
                                      height: 100,
                                      width: 100,
                                    ),
                                    SizedBox(height: 10),
                                    Text("PASSWORD SALAH !!", textAlign: TextAlign.center, style: alertLogin,),
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                              );
                            });
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage(
                                    husername: _username, hpassword: _password,)));
                      }
                    }
                  },
                  child: Text(
                    "Sign In",
                    style: buttonLogin,
                  ),
                )),
            Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 120,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "don’t have account ? ",
                        style: link,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegistrasiPage();
                          }));
                        },
                        child: Text(
                          "Register",
                          style: linkMasuk,
                        ),
                      )
                    ],
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_validation/pages/fontstyle.dart';
import 'package:login_validation/pages/login.dart';
import '../header/header2.dart';

class RegistrasiPage extends StatefulWidget {
  @override
  _RegistrasiPageState createState() => _RegistrasiPageState();
}

class _RegistrasiPageState extends State<RegistrasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Header2(),
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
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
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
              child: TextField(
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
                child: RaisedButton(
                  color: Color(0xff3282B8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Sign Up",
                    style: buttonLogin,
                  ),
                  onPressed: () {
                    Navigator.push(
                        // ignore: missing_return
                        context, MaterialPageRoute(builder: (context) {}));
                  },
                )),
            Container(
              padding: EdgeInsets.only(
                top: 20,
                left: 145,
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "have account ? ",
                        style: link,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return LoginPage();
                              }));
                        },
                        child: Text(
                          "Login",
                          style: linkMasuk,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

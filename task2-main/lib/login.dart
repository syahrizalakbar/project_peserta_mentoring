import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task2/bmi.dart';
import 'package:task2/main.dart';
import 'package:task2/register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _form = GlobalKey<FormState>();

  String username = "", password = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(19),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 77),
                    child: RichText(
                        text: TextSpan(
                            text: "d",
                            style:
                                TextStyle(color: Colors.orange, fontSize: 27),
                            children: <TextSpan>[
                          TextSpan(
                            text: "ev",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                              text: "rnz",
                              style: TextStyle(color: Colors.orange))
                        ])),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 19, vertical: 69),
                    padding: EdgeInsets.all(19),
                    color: Colors.white,
                    child: Form(
                      key: _form,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 9),
                            child: TextFormField(
                              controller: usernameController,
                              decoration: InputDecoration(
                                labelText: "Username",
                                helperStyle: TextStyle(color: Colors.red),
                              ),
                              validator: (text) {
                                if (text.isEmpty) {
                                  return "Username harus diisi";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 9),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                labelText: "Password",
                                helperStyle: TextStyle(color: Colors.red),
                              ),
                              validator: (text) {
                                if (text.isEmpty) {
                                  return "Password harus diisi";
                                }
                                return null;
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(9),
                            child: MaterialButton(
                              child: Text("Login"),
                              color: Colors.yellow,
                              onPressed: () {
                                if (_form.currentState.validate()) {
                                  setState(
                                    () {
                                      username = usernameController.text;
                                      password = passwordController.text;
                                      if (username == "admin" &&
                                          password == "admin") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Bmi(),
                                          ),
                                        );
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Username atau Password salah",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.CENTER,
                                            timeInSecForIosWeb: 3,
                                            backgroundColor: Colors.red,
                                            textColor: Colors.white,
                                            fontSize: 16.0);
                                        LinearProgressIndicator();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Login(),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Don't have an account ? "),
                  RaisedButton(
                    color: Colors.orange,
                    elevation: 0,
                    child: Text(
                      "Register now",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white, width: 1)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Register(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:week_2/register.dart';
import 'package:week_2/succeslogin.dart';
import 'package:week_2/gagal.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  _sign() {
    if (usernameController.text == 'admin' &&
        passwordController.text == 'admin') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Success()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Gagal()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.yellow,
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.yellow,
                child: TextFormField(
                  controller: usernameController,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'Username',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.yellow,
                child: TextFormField(
                  controller: passwordController,
                  autofocus: true,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: 'Password',
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                padding: EdgeInsets.fromLTRB(130, 20, 130, 20),
                minWidth: 250,
                color: Colors.blue,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  _sign();
                },
              ),
              FlatButton(
                child: Text(
                  "Not a member? signup now",
                  style: TextStyle(color: Colors.black),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                },
              )
            ],
          ),
        ));
  }
}

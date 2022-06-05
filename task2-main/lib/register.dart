import 'package:flutter/material.dart';
import 'package:task2/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Username"),
                      TextField(
                        scrollPadding: EdgeInsets.all(19),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[50],
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 17,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Email ID"),
                      TextField(
                        scrollPadding: EdgeInsets.all(19),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[50],
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Password"),
                      TextField(
                        obscureText: true,
                        scrollPadding: EdgeInsets.all(19),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[50],
                          enabledBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Builder(
                          builder: (context) => RaisedButton(
                            color: Colors.white,
                            child: Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      colors: [Colors.yellow, Colors.orange])),
                              child: Text(
                                "Register Now",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17.9),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 97, vertical: 7),
                            ),
                            padding: EdgeInsets.all(0.0),
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => CreateaPost(),
                              //   ),
                              // );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text("Already have an account ? "),
                  RaisedButton(
                    color: Colors.white,
                    child: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orange])),
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 17.9),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 97, vertical: 7),
                    ),
                    padding: EdgeInsets.all(0.0),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
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

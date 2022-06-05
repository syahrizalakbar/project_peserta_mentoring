import 'package:flutter/material.dart';
import 'package:week_2/login.dart';
import 'package:week_2/register.dart';
import 'package:week_2/calculatorIBM.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(50),
              padding: EdgeInsets.all(30),
              child: Text(
                'LOGO',
                style: TextStyle(fontSize: 72),
              ),
            ),
            Container(
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.red),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.fromLTRB(130, 10, 130, 10),
                    child: Text('LOGIN', style: TextStyle(color: Colors.black)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                    child:
                        Text('REGISTER', style: TextStyle(color: Colors.black)),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Register()));
                  },
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.fromLTRB(120, 10, 120, 10),
                    primary: Colors.amber,
                    elevation: 2,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Calculator BMI',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Calculator()));
                  },
                ),
              ),
            )
          ],
        ));
  }
}

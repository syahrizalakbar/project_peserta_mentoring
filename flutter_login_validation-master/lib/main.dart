import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_validation/pages/fontstyle.dart';
import 'package:login_validation/pages/registrasi.dart';
import 'pages/login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Main(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffBBE1FA),
      body: Container(
        padding: EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text("Kr", style: mainHeader),
            Text(
              "Welcome to, \n My Portofolio",
              style: subHeader,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            ButtonTheme(
                minWidth: 300,
                height: 50,
                splashColor: Colors.lightBlueAccent,
                child: RaisedButton(
                  color: Color(0xff3282B8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Sign In",
                    style: button,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                  },
                )),
            SizedBox(
              height: 10,
            ),
            ButtonTheme(
                minWidth: 300,
                height: 50,
                splashColor: Colors.lightBlueAccent,
                child: RaisedButton(
                  color: Color(0xff3282B8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "Sign Up",
                    style: button,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegistrasiPage();
                    }));
                  },
                ))
          ],
        ),
      ),
    );
  }
}

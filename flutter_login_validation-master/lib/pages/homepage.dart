import 'package:flutter/material.dart';
import 'package:login_validation/pages/login.dart';
import 'fontstyle.dart';
import '../header/header3.dart';

void main() {
  runApp(HomePage(hpassword: 'admin',husername: 'admin',));
}
class HomePage extends StatefulWidget {
  final String husername;
  final String hpassword;

  HomePage({Key key, @required this.husername, @required this.hpassword}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: <Widget>[
                Header3(),

                SizedBox(height: 60),

                Image(
                  image: AssetImage('assets/images/icon.png'),
                  height: 200,
                  width: 200,
                ),

                SizedBox(height: 40,),
                Container(
                  color: Color(0xffBBE1FA),
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: <Widget>[
                      Text('Username : ${widget.husername}', style: forText,),
                      Text('Password   : '  + widget.hpassword, style: forText)
                    ],
                  ),
                ),

                SizedBox(height: 20),
                ButtonTheme(
                    minWidth: 125,
                    height: 50,
                    splashColor: Colors.lightBlueAccent,
                    child: RaisedButton(
                      color: Color(0xff3282B8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Logout",
                        style: buttonLogin,
                      ),
                      onPressed: () {
                        Navigator.push(
                          // ignore: missing_return
                            context, MaterialPageRoute(builder: (context) {
                              return LoginPage();
                        }));
                      },
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}

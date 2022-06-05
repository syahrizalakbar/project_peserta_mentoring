import 'package:flutter/material.dart';
import 'package:flutter_task_2/pages/forget_password.dart';
import 'package:flutter_task_2/pages/home_page.dart';
import 'package:toast/toast.dart';
import 'register_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>{
  Widget _backButton(){
    return InkWell(
      onTap: (){
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(
                    fontSize: 12, fontWeight: FontWeight.w500
                ))
          ],
        ),
      ),
    );
  }

  Widget _title(){
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'Uda',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.headline4,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.orange,
          ),
          children: [
            TextSpan(
              text: 'Cod',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'ing',
              style: TextStyle(color: Colors.orange, fontSize: 30),
            ),
          ]
      ),
    );
  }

  final username = TextEditingController();
  final password = TextEditingController();
  @override
  void dispose(){
    username.dispose();
    password.dispose();
    super.dispose();
  }
  Widget _userNameField(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Email or Username",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true
              ),
            controller: username,
          )
        ],
      ),
    );
  }

  Widget _passwordField(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true
              ),
            controller: password,
          )
        ],
      ),
    );
  }

  Widget _emailAndPasswordEntry(){
    return Column(
      children: <Widget>[
        _userNameField(),
        _passwordField()
      ],
    );
  }

  final String usernameString = "admin";
  final String passwordString = "admin";
  Widget _loginButton(){
    return InkWell(
        onTap: (){
          if(username.text.toString() == usernameString && password.text.toString() == passwordString) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          }
          else if(username.text.isEmpty || password.text.isEmpty)
            Toast.show("Username/password can\'t be empty!", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          else
            Toast.show("Wrong username/password!", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Color(0xffdf8e33).withAlpha(100),
                    offset: Offset(2, 4),
                    blurRadius: 8,
                    spreadRadius: 2
                )
              ],
              color: Colors.orange
          ),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20, color: Colors.white,
            ),
          ),
        ));
  }

  Widget _line(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(thickness:
                1,
                ),
              ),
            ),
            Text('or'),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Divider(thickness:
                1,
                ),
              ),
            )
          ]
      ),
    );
  }

  Widget _facebookButton(){
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff1959a9),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(5)
                    )
                ),
                alignment: Alignment.center,
                child: Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400
                  ),),

              )),
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff2872ba),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(5),
                      topRight: Radius.circular(5),
                    )
                ),
                alignment: Alignment.center,
                child: Text(
                  'Log in with Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400
                  ),
                ),
              )
          )
        ],
      ),
    );
  }

  Widget _createAccountButton(){
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => RegisterPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10,),
            Text(
              'Register',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 13,
                  fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _forgetPasswordButton(){
    return InkWell(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ForgetPassword()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        alignment: Alignment.centerRight,
        child: Text(
            'Forget password?',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline
            ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * .2),
                    _title(),
                    SizedBox(height: 50),
                    _emailAndPasswordEntry(),
                    SizedBox(height: 20),
                    _loginButton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        Container(width: 10),
                        _forgetPasswordButton()
                      ],
                    ),
                    _line(),
                    _facebookButton(),
                    SizedBox(height: MediaQuery.of(context).size.height * .055),
                    _createAccountButton()
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton())
          ],
        ),
      ),
    );
  }
}
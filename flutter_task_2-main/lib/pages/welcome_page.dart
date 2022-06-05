import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';
import 'register_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => WelcomePageState();
}


class WelcomePageState extends State<WelcomePage>{
  Widget _loginButton(){
    return InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginPage()));
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
              color: Colors.white
          ),
          child: Text(
            'Login',
            style: TextStyle(fontSize: 20, color: Color((0xfff7892b)),
            ),
          ),
        ));
  }

  Widget _registerButton(){
    return InkWell(
        onTap: (){
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 13),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Text(
            'Register',
            style: TextStyle(fontSize: 20, color: Colors.white,
            ),
          ),
        ));
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
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: 'Cod',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'ing',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ]
      ),
    );
  }

  Widget _qrscan(){
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 30),
      child: Column(
        children: <Widget>[
          Text(
            'Quick login with touch ID',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Icon(
            Icons.fingerprint,
            size: 90,
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'QR login',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xfffbb448), Color(0xffe46b10)]
                )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _title(),
                SizedBox(
                  height: 80,
                ),
                _loginButton(),
                SizedBox(
                  height: 20,
                ),
                _registerButton(),
                SizedBox(
                  height: 20,
                ),
                _qrscan()
              ],
            ),
          ),
        )
    );
  }
}
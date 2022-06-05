import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toast/toast.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ForgetPasswordState();
}

class ForgetPasswordState extends State<ForgetPassword>{
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

  final _textController = TextEditingController();
  @override
  void dispose(){
    _textController.dispose();
    super.dispose();
  }
  Widget _emailField(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Enter email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: _textController,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true,
              ),
          )
        ],
      ),
    );
  }

  Widget _getNewPasswordButton(){
    return InkWell(
        onTap: (){
          setState(() {
            if(_textController.text.isEmpty)
              Toast.show("Email cannot empty!", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
            else
              Toast.show("New password sent!", context, duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
          });
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
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xfffbb448), Color(0xfff7892b)]
              )
          ),
          child: Text(
            'Send New Password',
            style: TextStyle(fontSize: 20, color: Colors.white,
            ),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height*.2),
                    _title(),
                    SizedBox(height: 50),
                    _emailField(),
                    SizedBox(height: 20),
                    _getNewPasswordButton()
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
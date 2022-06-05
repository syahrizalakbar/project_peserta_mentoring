import 'package:flutter/material.dart';
import 'package:flutter_week2/menuA/ui/register/components/body.dart';
import 'package:flutter_week2/menuA/ui/welcome/welcome_ui.dart';

class RegUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Back",
          style: new TextStyle(color: Colors.white),
        ),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WelcomeUi()),
            );
          },
        ),
      ),
      body: Body(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_week2/menuB/ui/login/components/body.dart';

class LoginUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          "Back",
          style: new TextStyle(color: Colors.white),
        ),
      ),
      body: Body(),
    );
  }
}

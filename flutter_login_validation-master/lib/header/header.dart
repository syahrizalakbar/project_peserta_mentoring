import 'package:flutter/material.dart';
import '../pages/fontstyle.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        Container(
          height: 230,
          decoration: BoxDecoration(
              color: Color(0xffBBE1FA),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(36),
                  bottomLeft: Radius.circular(36))),
        ),
        Positioned(
          left: 60,
          child: Text(
            "Please \n Sign In.",
            style: headerPages,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}

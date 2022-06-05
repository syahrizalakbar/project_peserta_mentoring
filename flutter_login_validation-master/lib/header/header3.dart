import 'package:flutter/material.dart';
import 'package:login_validation/pages/fontstyle.dart';

class Header3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(children: <Widget>[
        Container(
          height: 100,
          decoration: BoxDecoration(
              color: Color(0xffBBE1FA),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
        ),
        Positioned(
          left: 30,
          child: Text(
            "Welcome.",
            style: headerPages,
            textAlign: TextAlign.center,
          ),
        ),
      ]),
    );
  }
}

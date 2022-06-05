import 'package:flutter/material.dart';
import 'package:flutter_week2/menuA/ui/login/loginUi.dart';
import 'package:flutter_week2/menuA/ui/register/regUi.dart';
import 'package:flutter_week2/menuA/ui/Welcome/components/background.dart';
import 'package:flutter_week2/menuA/components/roundedButton.dart';
import 'package:flutter_week2/menuA/const.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/quran.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginUi();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "REGISTRASI",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return RegUi();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

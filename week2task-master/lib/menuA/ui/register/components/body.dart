import 'package:flutter/material.dart';
import 'package:flutter_week2/menuA/ui/login/loginUi.dart';
import 'package:flutter_week2/menuA/ui/register/components/background.dart';
import 'package:flutter_week2/menuA/ui/register/components/orDivider.dart';
import 'package:flutter_week2/menuA/ui/register/components/socialIcon.dart';
import 'package:flutter_week2/menuA/components/hasAccount.dart';
import 'package:flutter_week2/menuA/components/roundedButton.dart';
import 'package:flutter_week2/menuA/components/roundedInput.dart';
import 'package:flutter_week2/menuA/components/roundedPassword.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/reg.svg",
              height: size.height * 0.35,
            ),
            RoundedInput(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPassword(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            HasAccount(
              login: false,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

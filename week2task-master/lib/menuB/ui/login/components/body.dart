import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_week2/menuA/components/hasAccount.dart';
import 'package:flutter_week2/menuA/components/roundedButton.dart';
import 'package:flutter_week2/menuA/components/roundedInput.dart';
import 'package:flutter_week2/menuA/components/roundedPassword.dart';
import 'package:flutter_week2/menuA/ui/register/regUi.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

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
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInput(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPassword(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            HasAccount(
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

part of 'pages.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      body: Stack(children: [
        Container(color: mainBlueColor),
        SafeArea(
          child: Container(color: whiteColor),
        ),
        SafeArea(
          child: ClipPath(
            clipper: TopClippedPart(),
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topCenter,
                    colors: [whiteColor, mainBlueColor]),
              ),
            ),
          ),
        ),
        ListView(
          children: [
            SafeArea(
              child: GestureDetector(
                onTap: () => Get.off(() => MainPage()),
                child: Container(
                  margin: EdgeInsets.only(left: 24, top: 20, bottom: 24),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_back_ios, size: 18),
                      Text('Back')
                    ],
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InputTextField(
                      title: 'Username',
                      hintText: 'aditya',
                      controller: usernameController,
                    ),
                    InputTextField(
                      title: 'Email id',
                      hintText: 'devadit@gmail.com',
                      controller: emailController,
                    ),
                    InputTextField(
                      title: 'Password',
                      hintText: 'password',
                      controller: passwordController,
                      typeSecure: true,
                    ),
                    SizedBox(height: 12),
                    CustomMyButton(
                      btnColor: mainBlueColor,
                      textColor: whiteColor,
                      title: 'Register Now',
                      onPressedBtn: () {
                        if (!(emailController.text != '' &&
                            passwordController.text != '' &&
                            usernameController.text != '')) {
                          return Get.snackbar(
                            'Register Failed',
                            'All fields are required',
                            backgroundColor: yellowColor,
                            icon: Icon(Icons.warning_rounded),
                          );
                        } else {
                          Get.off(() => MainPage());
                        }
                      },
                    ),
                    AuthRichText(
                      textAsk: 'Already have an account ? ',
                      textAuth: ' Login',
                      onTap: () => Get.off(() => SignInPage()),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ]),
    );
  }
}

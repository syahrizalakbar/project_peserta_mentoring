part of 'pages.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
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
                        Text('Back'),
                      ],
                    ),
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    children: [
                      InputTextField(
                        title: 'Username',
                        hintText: 'Username',
                        controller: usernameController,
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
                        title: 'Login',
                        onPressedBtn: () {
                          if (!(usernameController.text != '' &&
                              passwordController.text != '')) {
                            return Get.snackbar(
                              'Login Failed',
                              'All fields are required',
                              backgroundColor: yellowColor,
                              icon: Icon(Icons.warning_rounded),
                            );
                          } else if (usernameController.text == 'admin' &&
                              passwordController.text == 'admin') {
                            Get.off(() => MainPage(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                ));
                          } else {
                            return Get.snackbar(
                              'Login Failed',
                              'Username and password wrong',
                              backgroundColor: yellowColor,
                              icon: Icon(Icons.warning_rounded),
                            );
                          }
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24, bottom: 24),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: Text('Forgot Password ? ')),
                      ),
                      AuthRichText(
                        textAsk: "Don't have an account ? ",
                        textAuth: ' Register',
                        onTap: () => Get.off(() => SignUpPage()),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

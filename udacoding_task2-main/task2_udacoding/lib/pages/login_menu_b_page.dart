part of 'pages.dart';

class LoginMenuB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return;
      },
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            color: primaryColor,
          ),
          SafeArea(
            child: Stack(
              children: [
                Container(
                  color: screenColor,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Header
                      HeaderWidgetComponent(
                        headerName: 'Login Menu B',
                        onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // LoginMenuB
                      LoginMenub(),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class LoginMenub extends StatefulWidget {
  @override
  _LoginMenubState createState() => _LoginMenubState();
}

class _LoginMenubState extends State<LoginMenub> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isClicked = false;

  getItemAndNavigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomePageMenub(
                  username: usernameController.text,
                  password: passwordController.text,
                )));
  }

  bool isHidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/illustration.png',
                height: MediaQuery.of(context).size.height / 4,
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          CustomTextField(
            labelText: "Username",
            hintText: "Masukan Username Anda",
            controller: usernameController,
          ),
          SizedBox(
            height: 16,
          ),
          CustomTextField(
            obscureText: !isHidePassword,
            labelText: "Password",
            hintText: "Masukan Password Anda",
            controller: passwordController,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isHidePassword = !isHidePassword;
                });
              },
              child: Theme(
                data: Theme.of(context).copyWith(primaryColor: null),
                child: (!isHidePassword)
                    ? Icon(
                        Icons.visibility_off,
                        size: 20,
                        color: Color(0xFFC6C6C6),
                      )
                    : Icon(
                        Icons.visibility,
                        size: 20,
                        color: Color(0xFFC6C6C6),
                      ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          if (isClicked)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 53),
              child: SpinKitFadingCircle(
                color: primaryColor,
                size: 70,
              ),
            )
          else
            Container(
              width: double.infinity,
              height: 45,
              child: RaisedButton(
                color: Colors.blue[800],
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                splashColor: Colors.black.withOpacity(0.4),
                visualDensity: VisualDensity.comfortable,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Login',
                  style: semiWhiteFont.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  if (usernameController.text == '' ||
                      passwordController.text == '') {
                    setState(() {
                      isClicked = false;
                    });
                    showAlert(
                      context,
                      alert: CustomAlertDialog(
                        title: "Username dan Password Kosong",
                        description: "Kamu belum mengisi username dan password",
                        imagePath: 'assets/images/access_denied.png',
                      ),
                    );
                  } else if (usernameController.text != 'admin' ||
                      passwordController.text != 'admin') {
                    setState(() {
                      isClicked = false;
                    });
                    showAlert(
                      context,
                      alert: CustomAlertDialog(
                        title: "Username dan Password Salah",
                        description:
                            "Username dan password yang anda masukan salah",
                        imagePath: 'assets/images/access_denied2.png',
                      ),
                    );
                  } else {
                    setState(
                      () => getItemAndNavigate(context),
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }
}

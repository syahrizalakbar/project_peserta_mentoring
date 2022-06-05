part of 'pages.dart';

class LoginMenuA extends StatefulWidget {
  @override
  _LoginMenuAState createState() => _LoginMenuAState();
}

class _LoginMenuAState extends State<LoginMenuA> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.back();
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
                        headerName: 'Login Menu A',
                        onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      // Menu Login
                      MenuALoginComponent(),
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

class MenuALoginComponent extends StatefulWidget {
  @override
  _MenuALoginComponentState createState() => _MenuALoginComponentState();
}

class _MenuALoginComponentState extends State<MenuALoginComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 70,
            child: Image.asset('assets/images/logo.png'),
          ),
          Container(
            margin: EdgeInsets.only(top: 70, bottom: 40),
            child: Text(
              'Welcome Back,\nExplorer & Learning',
              style: blackTextFont.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address',
                style: greyTextFont.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                onChanged: (text) {},
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Password',
                style: greyTextFont.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                onChanged: (text) {
                  setState(
                    () {},
                  );
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: 250,
              height: 45,
              margin: EdgeInsets.only(top: 10, bottom: 20),
              child: RaisedButton(
                child: Text(
                  'Login',
                  style: whiteTextFont.copyWith(fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: primaryColor,
                onPressed: () {},
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Start Fresh Now? ',
                style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(RegisterPageMenuA());
                },
                child: Text(
                  'Sign Up',
                  style: purpleTextFont,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

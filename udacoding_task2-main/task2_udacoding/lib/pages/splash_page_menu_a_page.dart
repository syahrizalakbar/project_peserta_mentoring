part of 'pages.dart';

class SplashPageMenuA extends StatelessWidget {
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
                        headerName: 'Menu A',
                        onTap: () {
                          Get.back();
                        },
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      MenuASplashComponent(),
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

class MenuASplashComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 70, bottom: 16),
            child: Text(
              'Start Learning',
              style: blackTextFont.copyWith(
                  fontSize: 20, fontWeight: FontWeight.w600),
            ),
          ),
          Text(
            'Start learning and exploring \nthe beecode app ',
            textAlign: TextAlign.center,
            style: greyTextFont.copyWith(
                fontSize: 16, fontWeight: FontWeight.w300),
          ),
          Container(
            width: 250,
            height: 45,
            margin: EdgeInsets.only(top: 70, bottom: 20),
            child: RaisedButton(
              child: Text(
                'Get Started',
                style: whiteTextFont.copyWith(fontSize: 16),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              color: primaryColor,
              onPressed: () {
                Get.to(RegisterPageMenuA());
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Already have an account? ',
                  style: greyTextFont.copyWith(fontWeight: FontWeight.w400)),
              GestureDetector(
                onTap: () {
                  Get.to(LoginMenuA());
                },
                child: Text(
                  'Sign In',
                  style: purpleTextFont,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

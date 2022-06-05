part of 'pages.dart';

class MainMenu extends StatelessWidget {
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
                      _HeaderComponent(),
                      SizedBox(
                        height: 24,
                      ),
                      // Menu Component
                      _MainMenuComponent(),
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

class _HeaderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 88,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Text(
              'Main Menu Task 2',
              style: boldWhiteFont.copyWith(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

class _MainMenuComponent extends StatefulWidget {
  @override
  __MainMenuComponentState createState() => __MainMenuComponentState();
}

class __MainMenuComponentState extends State<_MainMenuComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Silahkan Pilih Menu',
            style: semiBlackFont.copyWith(fontSize: 16),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainMenuWidget(
              menuName: 'Menu A',
              iconPath: 'assets/images/menu_a.png',
              onTap: () {
                Get.to(SplashPageMenuA());
              },
              color: primaryColor,
            ),
            SizedBox(
              width: 24,
            ),
            MainMenuWidget(
              menuName: 'Menu B',
              iconPath: 'assets/images/menu_b.png',
              onTap: () {
                Get.to(LoginMenuB());
              },
              color: Color(0xFF35645E),
            ),
          ],
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainMenuWidget(
              menuName: 'Menu C',
              iconPath: 'assets/images/menu_c.png',
              onTap: () {
                Get.to(CalculatorBmi());
              },
              color: Color(0xFF701313),
            ),
          ],
        ),
      ],
    );
  }
}

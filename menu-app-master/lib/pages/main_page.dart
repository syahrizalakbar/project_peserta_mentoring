part of 'pages.dart';

class MainPage extends StatefulWidget {
  final String username, password;
  MainPage({this.username = 'Aditya H.P', this.password = '123456'});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Stack(
          children: [
            Container(color: mainBlueColor),
            SafeArea(
              child: Container(color: greyPage),
            ),
            SafeArea(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                },
                children: [
                  Center(
                    child: HomePage(
                      username: widget.username,
                      password: widget.password,
                    ),
                  ),
                  Center(
                    child: CalculatorPage(),
                  ),
                  Center(
                    child: SignInPage(),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(left: 34),
            child: CustomBottonNavbar(
              selectedIndex: selectedPage,
              onTap: (index) {
                setState(() {
                  selectedPage = index;
                });
                pageController.jumpToPage(selectedPage);
              },
            ),
          ),
        ),
      ),
    );
  }
}

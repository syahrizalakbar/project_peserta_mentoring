part of 'pages.dart';

class HomePage extends StatelessWidget {
  final String? username, password;
  HomePage({this.username, this.password});
  @override
  Widget build(BuildContext context) {
    List<String> title = [
      "Membuat halaman login dan register menggunakan navigator",
      "Membuat Program Cek Login Sederhana",
      "Calculator BMI Sederhana ",
    ];
    Color setColor(int index) {
      return index.isEven ? mainBlueColor : Colors.deepPurple.withOpacity(0.65);
    }

    IconData setIcon(int index) {
      return (index == 0)
          ? Icons.touch_app_rounded
          : (index == 1)
              ? Icons.check_box_rounded
              : Icons.developer_board_rounded;
    }

    return Scaffold(
      backgroundColor: greyPage,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            color: Colors.white,
            height: 100,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Hi, $username',
                      style: blackFontStyleBold,
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Home page your password $password',
                      style: greyFontStyle,
                    )
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.exit_to_app_rounded),
                  onPressed: () => Get.off(() => SignInPage()),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 12),
            child: Text(
              'My Task',
              style: blackFontStyleBold,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            child: StaggeredGridView.countBuilder(
              shrinkWrap: true,
              primary: false,
              crossAxisCount: 4,
              itemCount: title.length,
              itemBuilder: (BuildContext context, int index) => InkWell(
                onTap: () {
                  if (title[index] == title.last) {
                    Get.to(() => CalculatorPage());
                  } else {
                    Get.off(() => SignInPage());
                  }
                },
                child: Card(
                  color: setColor(index),
                  shadowColor: setColor(index),
                  elevation: 8,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: greyPage,
                              child:
                                  Icon(setIcon(index), color: setColor(index)),
                            ),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: whiteColor, size: 14)
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          title[index],
                          style: whiteFontStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
              mainAxisSpacing: 2,
              crossAxisSpacing: 6,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Card(
              elevation: 4,
              color: yellowColor,
              shadowColor: yellowColor,
              margin: EdgeInsets.symmetric(horizontal: 18),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('INFO', style: blackFontStyleBold),
                    SizedBox(height: 6),
                    Text('Your username is $username', style: blackFontStyle1),
                    Text('Your password is $password', style: blackFontStyle1)
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, top: 12, bottom: 8),
            child: Text(
              'Today Task',
              style: blackFontStyleBold,
              textAlign: TextAlign.start,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 18),
            width: double.infinity,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                SizedBox(height: 8),
                cardSetting(
                  icon: Icons.touch_app_rounded,
                  title: 'Login & Register Navigator',
                  onTap: () => Get.off(() => SignInPage()),
                ),
                cardSetting(
                  icon: Icons.check_box_rounded,
                  title: 'Cek Login',
                  onTap: () => Get.off(() => SignInPage()),
                ),
                cardSetting(
                  icon: Icons.developer_board_rounded,
                  title: 'BMI Calculator',
                  onTap: () => Get.to(() => CalculatorPage()),
                ),
                SizedBox(height: 8),
              ],
            ),
          ),
          SizedBox(height: 90)
        ],
      ),
    );
  }

  cardSetting(
      {required IconData? icon,
      required String title,
      required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Icon(icon, color: mainBlueColor),
              SizedBox(width: 24),
              Expanded(
                child: Text(
                  title,
                  style: blueFontStyleBold,
                ),
              ),
              Icon(Icons.arrow_forward_ios_rounded,
                  color: mainBlueColor, size: 18)
            ],
          ),
        ),
      ),
    );
  }
}
